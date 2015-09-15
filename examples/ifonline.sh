echo "AUTHOR: 	Bc. Peter Horváth";
echo "PROGRAM: 	IfServer";
echo "VERSION:	1.0";
echo "--------------------------";

read -p "Set GPIO (n): " setgpio;
read -p "Server URL: " servername;

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
    connection=$(curl -s --head https://google.com | head -n 1);
else
    tested="ERR($tested)";
    echo "GPIO $setgpio test ... $tested";
    echo 0 > /sys/class/gpio/gpio$setgpio/value;
    exit;
fi
echo 0 > /sys/class/gpio/gpio$setgpio/value;

echo "GPIO $setgpio test ... $tested";
echo "GPIO reset ... complete";
echo "RPI testing connection ... $connection";
echo "RPI waiting for server $servername ... start";

ctr=1;
startsleep=4.9;
endsleep=0.1;
while true;
do
    sleep $startsleep;
    echo 1 > /sys/class/gpio/gpio$setgpio/value;
    sleep $endsleep;
    echo 0 > /sys/class/gpio/gpio$setgpio/value;
    if curl --output /dev/null --silent --head --fail "$servername"
    then
	startsleep=1;
	endsleep=30;
    fi
    ctr=$(($ctr+1));
done