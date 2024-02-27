#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
echo 'This is an example shell script'
echo 'Scripts here will run during build if specified in recipe.yml'
# Makes it so GNOME Shell runs on the iGPU
# mv /usr/share/glvnd/egl_vendor.d/10_nvidia.json /usr/share/glvnd/egl_vendor.d/90_nvidia.json
