#!/bin/bash

echo "Timelapse - name output file:"
read timelapseout
echo "Timelapse - frames per seconds (e.g. 20):"
read timelapsefps
echo "Timelapse - remove name cache"
rm *.txt
echo "... done step 1 of 3"
echo "Timelapse - create name cache"
ls -m *.jpg
ls -m *.jpg > cachenames.txt
echo "... done step 2 of 3"
echo "Timelapse - create timelapse mpeg4 movie ${timelapseout}.avi"
mencoder -nosound -ovc lavc -lavcopts vcodec=mpeg4 -o "$timelapseout".avi -mf type=jpeg:fps="$timelapsefps" mf://@cachenames.txt
echo "Timelapse - ${timelapseout}.avi ... done step 3 of 3"
echo "Timelapse - end"
exit 0
