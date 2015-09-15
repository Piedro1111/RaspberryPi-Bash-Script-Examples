echo "AUTHOR: 	Bc. Peter Horváth";
echo "PROGRAM: 	Color Music";
echo "VERSION:	2.0";
echo "--------------------------";

read -p "Set GPIO for green A: " setGreenA;
read -p "Set GPIO for orange B: " setOrangeB;
read -p "Set GPIO for green C: " setGreenC;
read -p "Set GPIO for orange D: " setOrangeD;
read -p "Set GPIO for green E: " setGreenE;
read -p "Set GPIO for orange F: " setOrangeF;
read -p "Set GPIO for red G: " setRedG;
read -p "Set GPIO input red G: " setInRedG;

echo $setGreenA > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio$setGreenA/direction;
echo $setOrangeB > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio$setOrangeB/direction;
echo $setGreenC > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio$setGreenC/direction;
echo $setOrangeD > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio$setOrangeD/direction;
echo $setGreenE > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio$setGreenE/direction;
echo $setOrangeF > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio$setOrangeF/direction;
echo $setRedG > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio$setRedG/direction;

echo 1 > /sys/class/gpio/gpio$setRedG/value;

echo $setInRedG > /sys/class/gpio/export;
echo in > /sys/class/gpio/gpio$setInRedG/direction;
cat /sys/class/gpio/gpio$setInRedG/value > teststate;
tested=$(cat teststate);

if [ $tested -eq 1 ]
then
    echo "GPIO color music ... start";
    ctr=1;
    sts=0;
    sleeptime=0.1;
    while true; 
    do
#on
	echo 1 > /sys/class/gpio/gpio$setGreenA/value;
	
	sleep $sleeptime;
	echo 1 > /sys/class/gpio/gpio$setOrangeB/value;
	
	sleep $sleeptime;
	echo 1 > /sys/class/gpio/gpio$setGreenC/value;
	
	sleep $sleeptime;
	echo 1 > /sys/class/gpio/gpio$setOrangeD/value;
	
	sleep $sleeptime;
	echo 1 > /sys/class/gpio/gpio$setGreenE/value;
	
	sleep $sleeptime;
	echo 1 > /sys/class/gpio/gpio$setOrangeF/value;
	
	sleep $sleeptime;
	echo 1 > /sys/class/gpio/gpio$setRedG/value;	
	sleep $sleeptime;
#off
	
	echo 0 > /sys/class/gpio/gpio$setGreenA/value;
	
	sleep $sleeptime;
	echo 0 > /sys/class/gpio/gpio$setOrangeB/value;
	
	sleep $sleeptime;
	echo 0 > /sys/class/gpio/gpio$setGreenC/value;
	
	sleep $sleeptime;
	echo 0 > /sys/class/gpio/gpio$setOrangeD/value;
	
	sleep $sleeptime;
	echo 0 > /sys/class/gpio/gpio$setGreenE/value;
	
	sleep $sleeptime;
	echo 0 > /sys/class/gpio/gpio$setOrangeF/value;
	
	sleep $sleeptime;
	echo 0 > /sys/class/gpio/gpio$setRedG/value;
	
	sleep $sleeptime;
	
        ctr=$(($ctr+1));
    done
fi
echo "GPIO color music ... end after $ctr loops";