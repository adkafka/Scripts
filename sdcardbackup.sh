echo BACKUP SD CARD CONTENTS TO FOLDER
echo BACKUP TIME:
date "+DATE: %m-%d-%Y%nTIME: %H:%M:%S"
rsync --exclude=syncr/ --exclude=SpanishDict/ --exclude=.madden10/  -vrpou /Volumes/NO\ NAME ~/Desktop/SD\ card/

