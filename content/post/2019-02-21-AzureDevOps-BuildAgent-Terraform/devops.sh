mkdir agent
cd agent
wget https://vstsagentpackage.azureedge.net/agent/2.147.1/vsts-agent-linux-x64-2.147.1.tar.gz
tar zxvf vsts-agent-linux-x64-2.147.1.tar.gz
sudo ./bin/installdependencies.sh
./config.sh --unattended --url $1 --auth pat --token $2 --pool $3 --agent $4 --acceptTeeEula
sudo ./run.sh install
sudo ./run.sh start