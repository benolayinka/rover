#!/bin/bash

# Load up .env
set -o allexport
[[ -f .env ]] && source .env
set +o allexport

echo "Streaming to.."
echo "APP_HOSTNAME = "
echo "$APP_HOSTNAME"
echo "PORT = "
echo "$VIDEO_PORT"

gst-launch-1.0 -v v4l2src device=/dev/video0 ! "image/jpeg, width=$VIDEO_WIDTH, height=$VIDEO_HEIGHT, framerate=(fraction)$VIDEO_FPS/1" ! rtpjpegpay ! udpsink host=$APP_HOSTNAME port=$VIDEO_PORT