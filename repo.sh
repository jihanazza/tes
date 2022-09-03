#!/bin/bash
    
sync () {
    cd ~
    time rclone copy znxtproject:rom/$ROM_PROJECT/rom.tar.zst ~ -P
    time tar -xaf rom.tar.zst
    time rm -rf rom.tar.zst
    cd ~/rom
    repo init --depth=1 --no-repo-verify -u https://github.com/CherishOS/android_manifest.git -b twelve-one -g default,-mips,-darwin,-notdefault
    git clone https://github.com/ariffjenong/local_manifest.git --depth=1 -b cherish-12.1 .repo/local_manifests
    repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j24 device/sony/maple_dsds device/sony/yoshino-common kernel/sony/msm8998 vendor/sony/maple_dsds
    #rm -rf .repo
    #find . -type d -name .git -exec rmdir {} \;
}

build () {
     cd ~/rom
     . build/envsetup.sh
     export CCACHE_DIR=~/ccache
     export CCACHE_EXEC=$(which ccache)
     export USE_CCACHE=1
     ccache -M 50G
     ccache -z
     export BUILD_HOSTNAME=znxt
     export BUILD_USERNAME=znxt
     export TZ=Asia/Jakarta
     lunch cherish_maple_dsds-user
    #make sepolicy -j24
    #make bootimage -j24
    #make systemimage &
    #make installclean
    mka bacon -j30
}

compile () {
    sync
    echo "done."
    build
}

cd ~/rom
ls -lh
compile &
sleep 114m
kill %1
#push_kernel
#push_device
#push_yoshino
#push_vendor

# Lets see machine specifications and environments
df -h
free -h
nproc
cat /etc/os*
