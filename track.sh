# demo opts
VIDEO_PATH=videos/2.mp4
YOLOX_MODEL=exps/example/mot/yolox_x_mix_det.py
YOLOX_CKPT=pretrained/bytetrack_x_mot17.pth.tar

# deepsort opts
DEEPSORT_MODEL=osnet_x0_25
#DEEPSORT_CKPT=None
DEEPSORT_CKPT=pretrained/osnet_x0_25_market1501_74.4%.pth
#DEEPSORT_CKPT=pretrained/osnet_x0_25_mars_76.0%.pth
#DEEPSORT_CKPT=pretrained/osnet_x0_25_skku_88.2%.pth

if [ $1 = "demo_custom" ]
then
    echo "Detecting on mp4 file"
    python tools/demo_track.py \
    video \
    -n yolox-x \
    -c pretrained/yolox_x_ckpt_0126.pth \
    --path videos/5.mp4 \
    --conf 0.1 \
    --nms 0.7 \
    --tsize 640 \
    --track_thresh 0.0 \
    --match_thresh 1.0 \
    --save_result \
    --device gpu

elif [ $1 = "demo_track" ]
then 
    echo "Tracking on mp4 file"
    python tools/demo_track.py \
    video \
    --path videos/1.mp4 \
    -f exps/example/mot/yolox_x_mix_det.py \
    -c pretrained/bytetrack_x_mot17.pth.tar \
    --fp16 \
    --fuse \
    --save_result

elif [ $1 = "track" ]
then
    echo "Tracking on test dataset"
    python tools/track.py \
    -f exps/example/mot/yolox_x_mix_det.py \
    -c pretrained/bytetrack_x_mot17.pth.tar \
    -b 1 \
    -d 1 \
    --fp16 \
    --fuse
    
    #python tools/interpolation.py
elif [ $1 = "deepsort" ]
then
    echo "Tracking on test dataset"
    python tools/track_deepsort.py \
    -f exps/example/mot/yolox_x_ablation.py \
    -c pretrained/bytetrack_ablation.pth.tar \
    model_name $DEEPSORT_MODEL \
    model_path $DEEPSORT_CKPT \
    -b 1 \
    --fp16 \
    --fuse
    
    #python tools/interpolation.py
else
    echo "something goes wrong"
fi
