#!/bin/sh -x

# The Xorg $DISPLAY and crop pixel offset on the screen comes after `-i`
# Add `-draw_mouse 0` to hide the cursor
# Substitute `-movflags +faststart` if your devices do not play the result

exec ffmpeg \
  -f alsa \
  -ac 2 \
  -i pulse \
  -f x11grab \
  -show_region 1 \
  -video_size 1280x720 \
  -i :0.0+1,26 \
  -b:a 64k \
  -preset ultrafast \
  -tune zerolatency \
  -vf format=yuv420p \
  -profile:v baseline \
  -level:v 3.1 \
  -map_metadata -1 \
  -f mp4 \
  -movflags frag_keyframe+empty_moov+delay_moov+default_base_moof \
  -strict -2 \
  -c:a aac \
  -c:v libx264 \
  -crf 30 \
  -r 24 \
  -y \
  $HOME/Desktop/screen-`date +%s`.mp4
