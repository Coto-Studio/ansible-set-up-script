#!/bin/bash
# Script to set up a new computer so that if can configured by ansible.
# To run this script type
# /bin/bash -c "$(curl -fsSL https://lnk.coto.studio/setup)"

## generate ssh-keys

echo "1) Run ssh-keygen"
if [ ! -f ~/.ssh/id_ed2551 ]; then
  ssh-keygen -t ed25519 -N '' -f ~/.ssh/id_ed2551
  echo "SSH key created."
fi

# Add network key to authorized_keys
echo "2) Add ansible ssh key"
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK40CjVSstXJ/r9ulgHcRGQkV6/MBmOPxOufq076KMOx" >> ~/.ssh/authorized_keys
echo "Ansible key add."

# Run macos commands
if [[ $OSTYPE == 'darwin'* ]]; then
  echo "3) Install xcode-select tools"
  sudo xcode-select --install
  
  echo "4) Print ip info"
  ifconfig -a
fi

# Run linux commands
if [[ $OSTYPE == 'linux'* ]]; then
  echo "3) Print ip info"
  hostname -I
fi