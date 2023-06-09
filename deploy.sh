#!/bin/bash
sshcmd="ssh -t frankie@64.225.0.193
$sshcmd screen -S "deployment" /home/frankie/app/prod_deploy.sh
