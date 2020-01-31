#!/bin/bash
# shellcheck disable=SC2154,SC2088,SC2046

function install_node_package {
  local package=$1
  report_from_package " $package being installed/updated"
  yarn global add "$package"
}

function isNpmPackageInstalled() {
  npm list --depth 1 -g "$1" > /dev/null 2>&1
}

if [ ! ${#macup_node_packages_yarn[@]} -eq 0 ]; then
  if isNpmPackageInstalled yarn;then
    for ((i=0; i<${#macup_node_packages_yarn[@]}; ++i)); do
      install_node_package "${macup_node_packages_yarn[i]}"
    done
    report_from_package " Global NodeJS packages:"
    yarn global list
    report_from_package " Outdated global NodeJS packages:"
    yarn global upgrade-interactive
  else
    report_from_package " WARNING: Yarn is not installed. Install Yarn and restart macup."
  fi
else
  report_from_package " WARNING: No items in the config file"
fi
