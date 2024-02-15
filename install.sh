#!/bin/bash

# Update the system
echo "Updating system packages..."
apt-get update && apt-get upgrade -y

# Install Cockpit without recommended packages
echo "Installing Cockpit..."
apt-get install cockpit --no-install-recommends -y

# Comment out root in /etc/cockpit/disallowed-users
echo "Modifying /etc/cockpit/disallowed-users..."
sed -i '/^root$/s/^/#/' /etc/cockpit/disallowed-users

# Download files
echo "Downloading files..."
wget https://github.com/45Drives/cockpit-file-sharing/releases/download/v3.3.4/cockpit-file-sharing_3.3.4-1focal_all.deb
wget https://github.com/45Drives/cockpit-navigator/releases/download/v0.5.10/cockpit-navigator_0.5.10-1focal_all.deb
wget https://github.com/45Drives/cockpit-identities/releases/download/v0.1.12/cockpit-identities_0.1.12-1focal_all.deb

# Install the downloaded .deb packages
echo "Installing downloaded packages..."
apt install ./*.deb -y

# Delete the downloaded files
echo "Deleting downloaded files..."
rm -f *.deb

# Reboot the system
echo "Rebooting the system..."
reboot
