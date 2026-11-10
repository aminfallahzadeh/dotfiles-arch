#!/usr/bin/env bash
swaync-client -cp
pkill -x swaync
sleep 0.5
hyprctl dispatch exec swaync
