echo "AUTHOR: 	Bc. Peter Horváth";
echo "PROGRAM: 	Blink";
echo "VERSION:	1.02";
echo "--------------------------";

read -p "Set blink time (s): " settime;
read -p "Set GPIO (n): " setgpio;
read -p "Set number of blinks (n):" setend;

echo $setgpio > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio$setgpio/direction;
echo 1 > /sys/class/gpio/gpio$setgpio/value;
sleep 1;
echo "--------------------------";

#test IO
echo 13 > /sys/class/gpio/export;
echo in > /sys/class/gpio/gpio13/direction;
cat /sys/class/gpio/gpio13/value > teststate;
tested=$(cat teststate);
if [ $tested -eq 1 ]; 
then
    tested="OK";
else
    tested="ERR($tested)";
    echo "GPIO $setgpio test ... $tested";
    echo 0 > /sys/class/gpio/gpio$setgpio/value;
    exit;
fi
echo 0 > /sys/class/gpio/gpio$setgpio/value;
#end - test IO

echo "GPIO $setgpio test ... $tested";
echo "GPIO reset ... complete";
echo "GPIO blink ... start";

ctr=1;
while [ $ctr -le $setend ]; 
do
    sleep $settime;
    echo 1 > /sys/class/gpio/gpio$setgpio/value;
    sleep $settime;

    #test IO in run
    cat /sys/class/gpio/gpio13/value > teststate;
    tested=$(cat teststate);
    if [ $tested -ne 1 ]; 
    then
	tested="ERR($tested)";
	echo "GPIO $setgpio $tested";
	echo 0 > /sys/class/gpio/gpio$setgpio/value;
	exit;
    fi
    echo 0 > /sys/class/gpio/gpio$setgpio/value;
    #end - test IO in run

    ctr=$(($ctr+1));
done

echo "GPIO blink ... end";