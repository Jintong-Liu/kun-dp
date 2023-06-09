#!/bin/bash

PS3="Select your architecture: "
download_url="https://github.com/Jintong-Liu/kun-dp/releases/latest/download"
install_target="/usr/local/bin/dp"

post_install() {
  if [ $? -eq 0 ]
  then
    echo "Install successfully, cli path: $install_target"
    exit 0
  else
    echo "Install failed"
    exit 1
  fi
}

install() {
  select opt in aarch64-apple-darwin x86_64-apple-darwin; do
    case $opt in
      aarch64-apple-darwin)
        echo "Installing for arm64, sudo required..."
        sudo wget -O $install_target "$download_url/dp_aarch64-apple-darwin"
        sudo chmod +x $install_target
        post_install
        ;;
      x86_64-apple-darwin)
        echo "Installing for x86_64, sudo required..."
        sudo wget -O $install_target "$download_url/dp_x86_64-apple-darwin"
        sudo chmod +x $install_target
        echo "Install successfully"
        post_install
        ;;
      quit)
        break
        ;;
      *) 
        echo "Invalid option $REPLY"
        break
        ;;
    esac
  done
}

install
