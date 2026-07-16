#!/usr/bin/env bash
# archinstoo live mode
# meant to be run as:
# `bash <(curl -sSL <url>)`

pacman -Syy || exit 1
# refresh
pacman -S --needed --noconfirm git python

git clone https://github.com/h8d13/archinstoo && cd archinstoo
./DEV --script live
