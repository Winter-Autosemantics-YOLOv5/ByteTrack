# demo opts
VIDEO_PATH=videos/2.mp4
YOLOX_MODEL=exps/example/mot/yolox_x_mix_det.py
YOLOX_CKPT=pretrained/bytetrack_x_mot17.pth.tar

if [ $1 = "demo" ]
then 
    echo "Tracking on mp4 file"
    python tools/demo_track.py \
    video \
    --path videos/2.mp4 \
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
