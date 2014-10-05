#!/bin/bash

DICT=/usr/share/dict/words
LIMIT=30
TOTAL=0
AVERAGE=0
function wordsGivenLength(){
	LENGTH=$1 #Set legnth to look for
	local AMOUNT #Set local variable to Amount of words of given length
	AMOUNT=`cat $DICT | egrep ^[a-z]{${LENGTH}}$ | wc -l | sed -e 's/^ *//g'`
	echo "${AMOUNT}"
}

echo "+--------+--------------+"
echo -e "| Length | NumOfWords \t|"
echo "+--------+--------------+"
for (( LENGTH=1; LENGTH <= ${LIMIT}; LENGTH++ ))
do 
	OUTPUT=`wordsGivenLength $LENGTH`
	echo -e "| ${LENGTH}   \t | ${OUTPUT}    \t|"
	TOTAL=`echo "$TOTAL + $OUTPUT" | bc`
	AVERAGE=`echo "$AVERAGE + ($LENGTH * $OUTPUT)" | bc`
done
echo "+--------+--------------+"
echo -e "| Total  | $TOTAL \t|"
echo "+--------+--------------+"
AVERAGE=`echo "scale=3 ; $AVERAGE / $TOTAL" |bc`
echo -e "| AVERAGE| $AVERAGE \t|"
echo "+--------+--------------+"
