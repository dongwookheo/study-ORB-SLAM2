# study-ORB-SLAM2

## 빌드 방법 (How to build)
```
docker build -t orb_slam:v2.0 .
```

## 실행 방법 (How to run)
- [download odometry dataset grayscale](https://www.cvlibs.net/datasets/kitti/eval_odometry.php)
- move to dataset directory into this repository
- if you don't have nvidia gpu, remove '--gpus all', '-e NVIDIA_DRIVER_... \'. 
```
docker run -it --privileged --gpus all --net=host --ipc=host \
    -e "DISPLAY=$DISPLAY" \
    -e "QT_X11_NO_MITSHM=1" \
    -e NVIDIA_DRIVER_CAPABILITIES=all \
    -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -v "~/study-ORB-SLAM2/dataset:/dataset" \
    orb_slam:v2.0
```

- Put below, in the Docker.
```
cd slam/study-ORB-SLAM2/Examples/Monocular
./mono_kitti ../../Vocabulary/ORBvoc.txt KITTI00-02.yaml /dataset/sequences/00
```

## Profiler
![profiler](https://github.com/dongwookheo/study-ORB-SLAM2/assets/124948998/26a208e3-78ab-4794-a370-c9330a31cd18)

## Evaluate trajectory with evo
<p float="left">
  <img src="https://github.com/dongwookheo/study-ORB-SLAM2/assets/124948998/4b6f396e-d052-4775-a7eb-29bbd0e175aa" width="45%" />
  <img src="https://github.com/dongwookheo/study-ORB-SLAM2/assets/124948998/b5adbe37-de8d-403e-b944-c1498f62a54c" width="45%" /> 
</p>

