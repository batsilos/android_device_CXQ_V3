----Thanks for fire855 & superdragonpt + DRteufel, who are contributing to the working CyanogenMod of MTK hardware(MT6592&MT6582).---

This is a device tree for Inew V3 which is based on MTK6582 SoC.
# Build

* init
  Sync CyanogenMod source:

        # repo init -u git://github.com/batsilos/android.git -b cm-12.1
        
        # repo sync

* full build
        
        # source build/envsetup.sh

        # brunch cm_V3-userdebug -jx (x number of cpu cores of building machine +1)

# MTK

Few words about mtk related binaries, services and migration peculiarities.

# Limitations

Services requires root:

`system/core/rootdir/init.rc`

  * surfaceflinger depends on sched_setscheduler calls, unable to change process priority from 'system' user (default user 'system')

  * mediaserver depends on /data/nvram folder access, unable to do voice calls from 'media' user (default user 'media')
