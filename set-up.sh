#!/bin/bash
# Script to set up a new computer so that if can configured by ansible.
# To run this script type
# /bin/bash -c "$(curl -fsSL https://lnk.coto.studio/setup)"

## generate ssh-keys
if [ ! -f ~/.ssh/id_ed2551 ]; then
  ssh-keygen -t ed25519 -N '' -f ~/.ssh/id_ed2551
  echo "private key created."
fi

# Add network key to authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK40CjVSstXJ/r9ulgHcRGQkV6/MBmOPxOufq076KMOx" >> ~/.ssh/authorized_keys
echo "Network key add."

# Run macos commands
if [[ $OSTYPE == 'darwin'* ]]; then
  sudo xcode-select --install
  ifconfig -a
fi

# Run linux commands
if [[ $OSTYPE == 'linux'* ]]; then
  hostname -I
fi