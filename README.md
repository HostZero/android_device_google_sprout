
# UNOFFICIAL TeamWin Recovery Projects for Android One First Gen.

XDA Thread: http://forum.xda-developers.com/crossdevice-dev/android-one-crossdevice-development-original-android-development/unofffical-twrp-3-0-2-0-android-one-t3358636

### How to Compile TWRP:
```sh
cd working_dir
mkdir -p device/google/sprout
git clone https://github.com/HostZero/android_device_google_sprout -b cm-13.0 device/google/sprout
git clone https://github.com/HostZero/android_kernel_mediatek_sprout -b cm-13.0-twrp kernel/mediatek/sprout
. build/envetup.sh
lunch cm_sprout-eng
make clean && make -j3 recoveryimage

### OUTPUT: working_dir/out/target/product/target/sprout/recovery.img
