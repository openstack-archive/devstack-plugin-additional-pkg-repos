Devstack Additional Package Repos
=================================

# Overview

Devstack plugin to configure additional distribution package repos, and
install select packages from that source.

The original aim is to allow testing within the gate current
libvirt/qemu releases.  The devstack plugin borrows some of the devstack
pluing machinery to allow other sources to be used simply.  This could
be expanded to OVS or DPDK.

As part of ```stack.sh```:

* Adds appropriate package repo
* Installs nominated packages

As part of ```unstack.sh``` | ```clean.sh```:

* Removes packages
* Removes package repo

# TODOs

* Document How to use
* Actually run tempest ;P
* upload to git-hub
* add experimental job to project-config

# Bugs

* https://bugs.launchpad.net/devstack-plugin-additional-pkg-repos

