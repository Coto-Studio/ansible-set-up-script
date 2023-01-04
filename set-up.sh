#!/bin/bash
# Script to set up a new computer so that if can configured by ansible.
# To run this script type
# /bin/bash -c "$(curl -fsSL https://lnk.coto.studio/setup)"

## generate ssh-keys

echo "1) Runing ssh-keygen"
echo "*****************\n"
if [ ! -f ~/.ssh/id_ed2551 ]; then
  ssh-keygen -t ed25519 -N '' -f ~/.ssh/id_ed2551
  echo "SSH key created."
else
  echo "Skipped..."
fi

# Add network key to authorized_keys
echo "2) Adding ansible ssh key"
echo "**********************\n"
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK40CjVSstXJ/r9ulgHcRGQkV6/MBmOPxOufq076KMOx" >> ~/.ssh/authorized_keys
echo "Ansible key added."

# Run macos commands
if [[ $OSTYPE == 'darwin'* ]]; then
  echo "3) Starting ssh service"
  echo "**********************\n"
  sudo systemsetup -f -setremotelogin on

  echo "4) Installing xcode-select tools"
  echo "**********************\n"
  sudo xcode-select --install
  
  echo "5) Print IP info"
  echo "*****************\n"
  ifconfig -a
fi

# Run linux commands
if [[ $OSTYPE == 'linux'* ]]; then
  echo "3) Starting ssh service"
  echo "**********************\n"
  sudo systemctl start sshd

  echo "3) Print IP info"
  echo "****************\n"
  hostname -I
fi