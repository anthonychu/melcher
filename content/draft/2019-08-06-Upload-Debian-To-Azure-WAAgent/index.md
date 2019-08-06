---
title: "Upload Debian image to Azure - waagent stuck"
date: 2019-08-06T10:47:56+02:00
2019: "08"
author: "Max Melcher"
draft: true
categories:
  - Azure
tags:
  - waagent
  - quickfix
hashtags: 
  - "#azure"
---

Yesterday I spent my day trying to upload a custom Debian VM to Azure and stuck during installation of the waagent daemon.
<!--more-->

## Background

I got an ISO file that installs a solution sitting on Debian 9. So I created a new hyper-v VM on Azure - now that you can run nested VMs on Azure - that is easier and faster than running it locally.

https://www.thomasmaurer.ch/2017/07/how-to-setup-nested-virtualization-in-microsoft-azure/

https://docs.microsoft.com/en-us/azure/virtual-machines/linux/debian-create-upload-vhd#manually-prepare-a-debian-vhd

http://blog.admindiary.com/install-microsoft-azure-linux-agent-waagent/

apt-get install unzip
wget https://github.com/Azure/WALinuxAgent/archive/v2.2.42.zip
unzip v2.2.42.zip
WALinuxAgent-2.2.42


wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install -U pip setuptools

systemctl enable waagent