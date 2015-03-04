#!/usr/bin/env bash
#
# Install Puppet on Ubuntu 12.04 and possibly future LTS version.

. /etc/lsb-release

PUPPET_VERSION=3.7.1-1puppetlabs1
PUPPET_REPO_URL="http://apt.puppetlabs.com/puppetlabs-release-${DISTRIB_CODENAME}.deb"

download_path=$(mktemp)
wget --output-document="${download_path}" "${PUPPET_REPO_URL}" 2>/dev/null
dpkg -i "${download_path}"

# You need to run apt-get update to pick up the newly added packages.
apt-get update

# Tell apt-get to install the proper puppet-common version, as it is can't
# figure it out by itself.
apt-get install -y puppet=$PUPPET_VERSION puppet-common=$PUPPET_VERSION
