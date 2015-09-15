echo "AUTHOR: 	Bc. Peter Horváth";
echo "PROGRAM: 	Semafor";
echo "VERSION:	1.0";
echo "--------------------------";

read -p "Set GPIO green (n): " green;
read -p "Set GPIO orange (n): " orange;
read -p "Set GPIO red (n): " red;
read -p "Set number of greens (n):" setend;
read -p "Set failure blink time (s): " failureblinktime;
read -p "Set time for orange (s): " orangetime;
read -p "Set time for green and red (s): " grtime;

echo $red > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio$red/direction;
echo 1 > /sys/class/gpio/gpio$red/value;
sleep 1;
echo $orange > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio$orange/direction;
echo 1 > /sys/class/gpio/gpio$orange/value;
sleep 1;
echo $green > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio$green/direction;
echo 1 > /sys/class/gpio/gpio$green/value;
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
    echo "GPIO $red test ... $tested";
    
    echo "GPIO semafor ... end";
    echo "--------------------------";
    echo "help: CTRL + C for cancel"
    echo 0 > /sys/class/gpio/gpio$red/value;
    echo 0 > /sys/class/gpio/gpio$green/value;
    while true;
    do
	echo 0 > /sys/class/gpio/gpio$orange/value;
	sleep $failureblinktime;
	echo 1 > /sys/class/gpio/gpio$orange/value;
	sleep $failureblinktime;
    done
fi
#end - test IO

echo "GPIO $red test ... $tested";
echo "GPIO reset ... complete";
echo "GPIO semafor ... start";

ctr=1;
while [ $ctr -le $setend ]; 
do
    sleep $orangetime;
    echo 1 > /sys/class/gpio/gpio$red/value;
    echo 0 > /sys/class/gpio/gpio$orange/value;
    echo 0 > /sys/class/gpio/gpio$green/value;
    
    #start - test IO red
    echo in > /sys/class/gpio/gpio13/direction;
    cat /sys/class/gpio/gpio13/value > teststate;
    tested=$(cat teststate);
    if [ $tested -eq 0 ]; 
    then
        tested="ERR($tested)";
        echo "GPIO $red test ... $tested";
        
	echo "GPIO semafor ... end";
	echo "--------------------------";
	echo "help: CTRL + C for cancel"
	echo 0 > /sys/class/gpio/gpio$red/value;
	echo 0 > /sys/class/gpio/gpio$green/value;

        while true;
        do
    	    echo 0 > /sys/class/gpio/gpio$orange/value;
	    sleep $failureblinktime;
	    echo 1 > /sys/class/gpio/gpio$orange/value;
	    sleep $failureblinktime;
	done
    fi
    #end - test IO red

    sleep $grtime;
    echo 1 > /sys/class/gpio/gpio$orange/value;
    sleep $orangetime;
    echo 0 > /sys/class/gpio/gpio$red/value;
    echo 0 > /sys/class/gpio/gpio$orange/value;
    echo 1 > /sys/class/gpio/gpio$green/value;
    sleep $grtime;
    echo 0 > /sys/class/gpio/gpio$red/value;
    echo 1 > /sys/class/gpio/gpio$orange/value;
    echo 0 > /sys/class/gpio/gpio$green/value;
    ctr=$(($ctr+1));
done

echo "GPIO semafor ... end";
echo "--------------------------";
echo "help: CTRL + C for cancel"
echo 0 > /sys/class/gpio/gpio$red/value;
echo 0 > /sys/class/gpio/gpio$green/value;
while true;
do
    echo 0 > /sys/class/gpio/gpio$orange/value;
    sleep $failureblinktime;
    echo 1 > /sys/class/gpio/gpio$orange/value;
    sleep $failureblinktime;
done
