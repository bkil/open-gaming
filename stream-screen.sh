#!/bin/sh -x

# sudo apt install v4l2loopback-utils v4l2loopback-dkms &&
# sudo modprobe v4l2loopback # after each reboot, or add to /etc/modprobe.d

exec ffmpeg \
  -re \
  -f x11grab \
  -show_region 1 \
  -video_size 1280x960 \
  -r 5 \
  -i :0.0+1,26 \
  -vf scale=640:480 \
  -f v4l2 \
  -vcodec rawvideo \
  -pix_fmt yuv420p \
  /dev/video1
