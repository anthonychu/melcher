<#
.SYNOPSIS
    .
.DESCRIPTION
    A simple script to connect to Azure VMs (linux or windows).
    Firstly a NSG rule is created to allow the connection from your pc to the VM
    Then the conenction is established with either MSTSC or ssh 
    After the connection is closed, the script removes the NSG rule

    Assumptions:
        The VM has a public IP and is running
        The NSG has no general allow rule for RDP or SSH
        For Linux: the admin user that was used to provision the VM is used for the connection

.PARAMETER VMName
    Name of the VM you want to connect to
.PARAMETER ResourceGroupName
    Name of the ResourceGroup of the VM
.PARAMETER Protocol
    Protocol: RDP for Windows, SSH for Linux VMs
.PARAMETER WaitTime
    The time the script waits until a session is established. 
    This is because it takes a while until the NSG kicks in.
.EXAMPLE
    jit-connect -protocol <RDP | SSH> -VMName <VMName> -ResourceGroup <ResourceGroupName>
.NOTES
    Author: Max Melcher
    Date:   November 21, 2018
    Website: https://melcher.it/post/2018-11-20-AzureSecureRDPLogin/
#>
Param(
    [Parameter(Position = 0,
        Mandatory = $True,
        ValueFromPipeline = $True)]
    [string]$VMName,

    [Parameter(Position = 1,
        Mandatory = $True,
        ValueFromPipeline = $True)]
    [string]$ResourceGroupName,
    
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [ValidateSet('RDP','SSH')]
    [string]$Protocol,

    [Parameter(Position = 2,
    Mandatory = $False,
    ValueFromPipeline = $True)]
    [int]$WaitTime = 45
)

write-host "Establishing connection to VM $VMName"


#check the connection - if not available, sign in
$ctx = Get-AzureRmContext
if (!$ctx.Account)
{
    Connect-AzureRmAccount -WarningAction SilentlyContinue
}

$status = Get-AzureRmVm -ResourceGroupName $ResourceGroupName -Name $VMName `
    -ErrorAction SilentlyContinue -Status -WarningAction SilentlyContinue
$vm = Get-AzureRmVm -ResourceGroupName $ResourceGroupName -Name $VMName `
    -ErrorAction SilentlyContinue -WarningAction SilentlyContinue

if (!$status)
{
    Write-Host "VM $VMName not found in ResourceGroup $ResourceGroupName"
    exit
}

foreach($vmStatus in $status.Statuses ){
    if($vmStatus.Code -eq "PowerState/stopped" -or $vmStatus.Code -eq "PowerState/deallocated")
    {
        write-host "$VMName is not running!"
        exit
    }
}

if ($Protocol -eq "RDP")
{
    $port = 3389
}
else {
    #ssh
    $port = 22
}

#get the VM's public ip
$nic = Get-AzureRmNetworkInterface -ResourceGroupName $ResourceGroupName `
    -Name $(Split-Path -Leaf $vm.NetworkProfile.NetworkInterfaces[0].Id)
$config = $nic | Get-AzureRmNetworkInterfaceIpConfig
$ipname = $config.PublicIpAddress.Id.Substring($config.PublicIpAddress.Id.LastIndexOf("/")+1)
$vmIP = (Get-AzureRmPublicIpAddress -Name $ipname -ResourceGroupName $ResourceGroupName).IpAddress
write-host "VM Public IP is: $vmIP"

$hostname = $env:computername #your hostname
$ip = Invoke-RestMethod http://ipinfo.io/json | Select -exp ip #your external IP
write-host "Your Public IP is: $ip"

#set the allow rule to the NSG
$nsg = Get-AzureRmNetworkSecurityGroup -Name $nic.NetworkSecurityGroup.Id.Substring($nic.NetworkSecurityGroup.Id.LastIndexOf("/")+1) `
  -ResourceGroupName $ResourceGroupName

foreach ($rule in $nsg.SecurityRules)
{
    if ($rule.Name -notlike "JIT-*" -and $rule.Access -eq "Allow" -and $rule.DestinationPortRange -eq $port)
    {
        Write-Host -ForegroundColor Red "The general rule '$($rule.Name)' for port $port is already present. Remove it or set the access to 'deny'"
        exit
    }
}

#set the allow rule to the NSG
$rule = Get-AzureRmNetworkSecurityRuleConfig -Name "JIT-$hostname" -NetworkSecurityGroup $nsg -ErrorAction SilentlyContinue
if ($rule)
{
    #do nothing because its there
    write-host "NSG rule is already present"
}
else {
    write-host "Creating $Protocol NSG rule for JIT access."
    Add-AzureRmNetworkSecurityRuleConfig -NetworkSecurityGroup $nsg -Name "JIT-$hostname" -Description "Allow $Protocol for $hostname" `
        -Access "Allow" -Protocol "Tcp" -Direction "Inbound" -Priority "109" -SourceAddressPrefix $ip `
        -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange $port | out-null

    $nsg | Set-AzureRmNetworkSecurityGroup | out-null

    #wait 10 seconds for the NSG rule
    write-host -ForegroundColor Yellow "waiting $WaitTime seconds for the NSG rule"
    Start-Sleep -Seconds $WaitTime
}

#launch session and wait till exit
write-host "`n`n`n`n`n"
write-host -ForegroundColor Yellow "#################################"
write-host -ForegroundColor Yellow "#################################"
write-host "Do not close this window until you have closed the $Protocol connection!"
write-host -ForegroundColor Yellow "#################################"
write-host -ForegroundColor Yellow "#################################"

if ($Protocol -eq "RDP")
{
    mstsc /v:$vmIP | out-null
}
else
{
    $user = $vm.OSProfile.AdminUsername
    ssh "$user@$vmIP"
}

#remove the nsg Rule
write-host "`n`n`n`n`n"
write-host "removing the NSG rule"
Remove-AzureRmNetworkSecurityRuleConfig -NetworkSecurityGroup $nsg -Name "JIT-$hostname" | out-null
$nsg | Set-AzureRmNetworkSecurityGroup | out-null
write-host -ForegroundColor Green "done." 