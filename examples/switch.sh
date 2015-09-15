echo "AUTHOR: 	Bc. Peter Horváth";
echo "PROGRAM: 	OnOff Switch";
echo "VERSION:	1.0";
echo "--------------------------";

echo "GPIO switch ... start";

ctr=1;
sts=0;
while true; 
do
    read -p "Switch state GPIO (n): " setgpio;
    
    echo $setgpio > /sys/class/gpio/export;
    echo out > /sys/class/gpio/gpio$setgpio/direction;

    #test IO in run
    if [ $sts -eq 1 ]; 
    then
	echo 0 > /sys/class/gpio/gpio$setgpio/value;
	echo "GPIO $setgpio is OFF";
	sts=0;
    else
	echo 1 > /sys/class/gpio/gpio$setgpio/value;
	echo "GPIO $setgpio is ON";
	sts=1;
    fi
    #end - test IO in run

    ctr=$(($ctr+1));
done

echo "GPIO OnOff ... end after $ctr status switch";