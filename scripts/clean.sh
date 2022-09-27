#!/usr/bin/env bash

# Fail fast
set -Ee
set -u
set -o pipefail

sudo apt clean
sudo apt autoremove

sudo journalctl --rotate
sudo journalctl --vacuum-time=7days

rm ~/.cache/ -r
rm ~/.config/google-chrome/Default/Service Worker/CacheStorage/ -r

cargo cache -a
# npm clean cache