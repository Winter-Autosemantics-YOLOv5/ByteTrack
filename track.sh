

if [ $1 = "demo" ]
then 
    echo "Tracking on mp4 file"
    python tools/demo_track.py \
    video \
    --path videos/1.mp4\
    -f exps/example/mot/yolox_x_mix_det.py \
    -c pretrained/bytetrack_x_mot17.pth.tar \
    --fp16 \
    --fuse \
    --save_result

elif [ $1 = "track" ]
then
    echo "Tracking on test dataset"
    python3 tools/track.py \
    -f exps/example/mot/yolox_x_mix_det.py \
    -c pretrained/bytetrack_x_mot17.pth.tar \
    -b 1 \
    -d 1 \
    --fp16 \
    --fuse
    
    python3 tools/interpolation.py
else
    echo "something goes wrong"
fi
