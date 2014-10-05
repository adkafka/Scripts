#/bin/sh

echo "---------------------------------"
echo "---------------------------------"
echo "---------------------------------"
echo "This script copies the music files from the computer onto a HDD"
echo "If you want to exit this script while it is running, press crtl+c"
echo "---------------------------------"
echo "---------------------------------"

echo "Please drag the icon of the HDD (from the desktop or anywhere else) that you would like to transfer the information to into THIS terminal window, then press ENTER"
read dest

music=`echo $HOME`/Music/iTunes/iTunes\ Music/

echo The source location is $music
echo The target directory is $dest

echo "Is this correct? Y for yes, N for no" 
read yn

if [ "$yn" == "n" ]
then 
  echo "Input the path to the source folder"
  read music
  echo "Input the path to the destination"
  read dest
  echo "The source location is $music"
  echo "The target directory is $dest"
  echo "Beginning to copy files..."
else
   echo "Beginning to copy files..."
fi

rsync -vrud -n $music $dest