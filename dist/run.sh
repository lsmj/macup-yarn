#!/bin/bash
# shellcheck disable=SC2154,SC2088,SC2046

function install_node_package {
  local package=$1
  report_from_package " $package being installed/updated"
  yarn global add "$package"
}

if [ ! ${#macup_node_packages[@]} -eq 0 ]; then # If config has npm entries
  # Checking if NodeJS is installed
  if [ ! "$(command -v node)" ]; then # If NodeJS is not installed
    report_from_package " WARNING: NodeJS is not installed. Installing.."
    if [ ! "$(command -v brew)" ]; then # If Homebrew is not installed
      report_from_package " WARNING: Homebrew is not installed. Installing.."
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    brew install node
  fi
  # Install Node packages
  for ((i=0; i<${#macup_node_packages[@]}; ++i)); do
    install_node_package "${macup_node_packages[i]}"
  done
  report_from_package " Global NodeJS packages:"
  yarn global list
  report_from_package " Outdated global NodeJS packages:"
  yarn global upgrade-interactive
fi
