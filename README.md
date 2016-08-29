
# UNOFFICIAL TeamWin Recovery Projects for Android One First Gen.

XDA Thread: http://forum.xda-developers.com/crossdevice-dev/android-one-crossdevice-development-original-android-development/unofffical-twrp-3-0-2-0-android-one-t3358636

### How to Compile TWRP:
```sh
cd working_dir
mkdir -p device/google/sprout
git clone https://github.com/HostZero/android_device_google_sprout -b android-6.0 device/google/sprout
. build/envetup.sh
lunch omni_sprout-eng
make clean && make -j3 recoveryimage

### OUTPUT: working_dir/out/target/product/target/sprout/recovery.img
