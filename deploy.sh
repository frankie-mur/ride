#!/bin/bash
sshcmd="ssh -t frankie@ubuntu-s-1vcpu-1gb-nyc3-01"
$sshcmd screen -S "deployment" /home/frankie/app/prod_deploy.sh
