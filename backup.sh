echo BACKUP MUSIC AND MOVIES TO EXTERNAL DRIVE
echo BACKUP TIME:
date "+DATE: %m-%d-%Y%nTIME: %H:%M:%S"


rsync --exclude=Movies/ --exclude=Podcasts/ -vrpou ~/Music/iTunes/iTunes\ Music /Volumes/ADAMS\ STUFF/Music


rsync --exclude=iTunes\ Music -vrpou ~/Music/iTunes/ /Volumes/ADAMS\ STUFF/Music


echo SUCCESS