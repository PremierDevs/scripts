#!/bin/bash

# Uninstall Script

if [ "${USER}" != "root" ]; then
	echo "$0 must be run as root!"
	exit 2
fi

while true; do
read -p "Remove all Docker Machine VMs? (Y/N): " yn
case $yn in
[Yy]* ) docker-machine rm -f $(docker-machine ls -q); break;;
[Nn]* ) break;;
* ) echo "Please answer yes or no."; exit 1;;
esac
done

echo "Removing Applications..."
rm -rf /Applications/Docker.app

echo "Removing docker binaries..."
rm -f /usr/local/bin/docker
rm -f /usr/local/bin/docker-machine
rm -r /usr/local/bin/docker-machine-driver*
rm -f /usr/local/bin/docker-compose
rm -f /usr/local/bin/com.docker.cli
rm -f /usr/local/bin/docker-compose
rm -f /usr/local/bin/docker-compose-v1
rm -f /usr/local/bin/docker-credential-desktop
rm -f /usr/local/bin/docker-credential-ecr-login
rm -f /usr/local/bin/docker-credential-osxkeychain
rm -f /usr/local/bin/hub-tool
rm -f /usr/local/bin/hyperkit
rm -f /usr/local/bin/kubectl.docker
rm -f /usr/local/bin/vpnkit
rm -Rf ~/.docker
rm -Rf ~/Library/Containers/com.docker.docker;
rm -Rf ~/Library/Application\ Support/Docker\ Desktop
rm -Rf ~/Library/Group\ Containers/group.com.docker
rm -f ~/Library/HTTPStorages/com.docker.docker.binarycookies
rm -f /Library/PrivilegedHelperTools/com.docker.vmnetd
rm -f /Library/LaunchDaemons/com.docker.vmnetd.plist
rm -Rf ~/Library/Logs/Docker\ Desktop
rm -Rf /usr/local/lib/docker
rm -f ~/Library/Preferences/com.docker.docker.plist
rm -Rf ~/Library/Saved\ Application\ State/com.electron.docker-frontend.savedState
rm -f ~/Library/Preferences/com.electron.docker-frontend.plist

echo "Removing boot2docker.iso"
rm -rf /usr/local/share/boot2docker

echo "Forget packages"
pkgutil --forget io.docker.pkg.docker
pkgutil --forget io.docker.pkg.dockercompose
pkgutil --forget io.docker.pkg.dockermachine
pkgutil --forget io.boot2dockeriso.pkg.boot2dockeriso

echo "All Done!"
