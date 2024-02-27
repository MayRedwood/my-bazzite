#!/usr/bin/env bash
set -oue pipefail

# Get the patched mutter repo
wget https://copr.fedorainfracloud.org/coprs/trixieua/mutter-patched/repo/fedora-$(rpm -E %fedora)/trixieua-mutter-patched-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_trixieua-mutter-patched.repo

# Reset overrides
rpm-ostree override replace --experimental --from repo=updates \
  gnome-control-center \
  gnome-control-center-filesystem
# Apply our overrides
rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:trixieua:mutter-patched \
  gnome-shell \
  mutter \
  mutter-common \
  xorg-x11-server-Xwayland \
  gdm

# Disable the COPR
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/_copr_trixieua-mutter-patched.repo
