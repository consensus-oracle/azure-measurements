# Azure Measurement Scripts

## Instructions

(1) Setup example measurement VM
- Create a simple Ubuntu 14.03 instance using Azure WebGU
- Run ssh-keygen locally and call the key azure_key, copy the public key (in ~/.ssh/azure_key.pub) to the new VM (~/.ssh/authorized_keys).
- git clone this repo and test the measure.sh script
- adding measure.sh as a service

(2) Snapshot example measurement VM
- Run ```sudo waagent -deprovision``` on the VM to prepere it for snapshotting
- Snapshot in the Azure webGU

(3) Clone example measurement VM
- rename VM_IMAGE in deploy.sh
- run deploy.sh
- run ```azure vm list``` to check VM state

(4) Collect measurement data
- run collect.sh