# Build

* features

  * wifi
  * gsm (call in / call out / hangout)
  * egl
  * sound
  * camera
  * BT
  * sensors

* init

        # repo init -u git://github.com/fire855/android.git -b cm-12.1
        
        # repo sync
        
        # source build/envsetup.sh or . build/envsetup.sh
        
        # lunch cm_V3-userdebug

* recoveries

        # . build/tools/device/makerecoveries.sh cm_V3-userdebug
    
        # mka bootimage

* full build

        # brunch cm_V3-userdebug -jx (x number of cpu cores of building machine)

# MTK

Few words about mtk related binaries, services and migration peculiarities.

# Limitations

Services requires root:

`system/core/rootdir/init.rc`

  * surfaceflinger depends on sched_setscheduler calls, unable to change process priority from 'system' user (default user 'system')

  * mediaserver depends on /data/nvram folder access, unable to do voice calls from 'media' user (default user 'media')
