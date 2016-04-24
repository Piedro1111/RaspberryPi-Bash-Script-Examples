echo "AUTHOR: 	Bc. Peter Horváth";
echo "PROGRAM: 	Blinkcheck";
echo "VERSION:	1.0";
echo "--------------------------";

read -p "Set GPIO out (power supply): " outin;
read -p "Set GPIO in (input line to Raspberry PI): " gpioin;

echo "Set to current time (ntpdate): "
ntpdate

read -p "Set path to rewrite log file: " pathlog;
read -p "Accuracy (0.01s~60s, 60 seconds is lowest accuracy): " accuracylvl;

echo $outin > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio$outin/direction;
echo 1 > /sys/class/gpio/gpio$outin/value;

echo $gpioin > /sys/class/gpio/export;
echo in > /sys/class/gpio/gpio$gpioin/direction;

echo "power=1" | tee -i $pathlog;
echo "ntpdate=1" | tee -a -i $pathlog;
ntpdate | tee -a -i $pathlog;
date +"%F %T.%N %Z;" | tee -a -i $pathlog;
sleep 1;
echo "--------------------------" | tee -a -i $pathlog;


ctr=1;
blinkswitch=0;
dif=0;
string1=date +"%T.%N";
while true;
do
  #test IO in run
  cat /sys/class/gpio/gpio$gpioin/value > teststate;
  ntpinputdata=$(cat teststate);

  if [ $ntpinputdata -eq 1 ];
  then
	if [ $blinkswitch -eq 0 ];
	then
		string2=date +"%T.%N";
		StartDate=$(date -u -d "$string1" +"%s.%N");
		FinalDate=$(date -u -d "$string2" +"%s.%N");
		dif=$(date -u -d "0 $FinalDate sec - $StartDate sec" +"%H:%M:%S.%N");
		date +"%F %T.%N %Z;" | tee -a -i $pathlog;
		blinkswitch=1;
		string1=string2;
	fi
  else
	blinkswitch=0;
  fi
  ctr=$(($ctr+1));

  sleep $accuracylvl;
done

echo "Blinkcheck ... end";
