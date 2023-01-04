#!/bin/bash
# Script to set up a new computer so that if can configured by ansible.
# To run this script type
# sh -c "$(https://lnk.coto.studio/setup)"

## generate ssh-keys
if [ ! -f ~/.ssh/id_ed2551 ]; then
  ssh-keygen -t ed25519 -N '' -f ~/.ssh/id_ed2551
fi

# Add network key to authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK40CjVSstXJ/r9ulgHcRGQkV6/MBmOPxOufq076KMOx" >> ~/.ssh/authorized_keys

# Install Xcode command line tools if running on macos 
if [[ $OSTYPE == 'darwin'* ]]; then
  sudo xcode-select --install
fi

# Print out ip and username info