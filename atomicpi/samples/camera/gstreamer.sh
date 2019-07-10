#!/bin/sh
exec v4l-wrap gst-launch-1.0 \
     v4l2src device=/dev/video0 \
     ! filesink location=video.h264
