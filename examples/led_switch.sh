echo "AUTHOR: 	Bc. Peter Horváth";
echo "PROGRAM: 	LED SWITCH";
echo "VERSION:	1.0";
echo "--------------------------";

variable=4;
outin=18;
setgpioleft=23;
setgpioright=16;

echo $outin > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio$outin/direction;
echo 1 > /sys/class/gpio/gpio$outin/value;


echo 12 > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio12/direction;
echo 1 > /sys/class/gpio/gpio12/value;
echo 4 > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio4/direction;
echo 1 > /sys/class/gpio/gpio4/value;
echo 27 > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio27/direction;
echo 1 > /sys/class/gpio/gpio27/value;
echo 22 > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio22/direction;
echo 1 > /sys/class/gpio/gpio22/value;
echo 5 > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio5/direction;
echo 1 > /sys/class/gpio/gpio5/value;
echo 6 > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio6/direction;
echo 1 > /sys/class/gpio/gpio6/value;
echo 26 > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio26/direction;
echo 1 > /sys/class/gpio/gpio26/value;

echo 13 > /sys/class/gpio/export;
echo in > /sys/class/gpio/gpio13/direction;

echo $setgpioleft > /sys/class/gpio/export;
echo in > /sys/class/gpio/gpio$setgpioleft/direction;

echo $setgpioright > /sys/class/gpio/export;
echo in > /sys/class/gpio/gpio$setgpioright/direction;

sleep 1;
echo "--------------------------";

ctr=1;
while true; 
do
  #test IO in run
  cat /sys/class/gpio/gpio$setgpioleft/value > teststateleft;
  left=$(cat teststateleft);
  cat /sys/class/gpio/gpio$setgpioright/value > teststateright;
  right=$(cat teststateright);

  if [ $right -eq $left ];
  then
    if [ $right -eq 1 ];
    then
        echo "double";
	
#	echo 12 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio12/direction;
	echo 0 > /sys/class/gpio/gpio12/value;
#	echo 4 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio4/direction;
	echo 0 > /sys/class/gpio/gpio4/value;
#	echo 27 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio27/direction;
	echo 0 > /sys/class/gpio/gpio27/value;
#	echo 22 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio22/direction;
	echo 0 > /sys/class/gpio/gpio22/value;
#	echo 5 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio5/direction;
	echo 0 > /sys/class/gpio/gpio5/value;
#	echo 6 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio6/direction;
	echo 0 > /sys/class/gpio/gpio6/value;
#	echo 26 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio26/direction;
	echo 0 > /sys/class/gpio/gpio26/value;
    fi
  else
    if [ $left -eq 1 ];
    then
	echo "left";
	variable=$(($variable-1));
#	echo 12 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio12/direction;
	echo 0 > /sys/class/gpio/gpio12/value;
#	echo 4 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio4/direction;
	echo 0 > /sys/class/gpio/gpio4/value;
#	echo 27 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio27/direction;
	echo 0 > /sys/class/gpio/gpio27/value;
#	echo 22 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio22/direction;
	echo 0 > /sys/class/gpio/gpio22/value;
#	echo 5 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio5/direction;
	echo 0 > /sys/class/gpio/gpio5/value;
#	echo 6 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio6/direction;
	echo 0 > /sys/class/gpio/gpio6/value;
#	echo 26 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio26/direction;
	echo 0 > /sys/class/gpio/gpio26/value;
	
    fi
    if [ $right -eq 1 ];
    then
	echo "right";
	variable=$(($variable+1));
#	echo 12 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio12/direction;
	echo 0 > /sys/class/gpio/gpio12/value;
#	echo 4 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio4/direction;
	echo 0 > /sys/class/gpio/gpio4/value;
#	echo 27 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio27/direction;
	echo 0 > /sys/class/gpio/gpio27/value;
#	echo 22 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio22/direction;
	echo 0 > /sys/class/gpio/gpio22/value;
#	echo 5 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio5/direction;
	echo 0 > /sys/class/gpio/gpio5/value;
#	echo 6 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio6/direction;
	echo 0 > /sys/class/gpio/gpio6/value;
#	echo 26 > /sys/class/gpio/export;
#	echo out > /sys/class/gpio/gpio26/direction;
	echo 0 > /sys/class/gpio/gpio26/value;

    fi

    case $variable in
    1)
    switchled=12;
    ;;
    2)
    switchled=4;
    ;;
    3)
    switchled=27;
    ;;
    4)
    switchled=22;
    ;;
    5)
    switchled=5;
    ;;
    6)
    switchled=6;
    ;;
    7)
    switchled=26;
    ;;
    *)
    echo "Out of range";
    ;;
    esac

#    echo $switchled > /sys/class/gpio/export;
#    echo out > /sys/class/gpio/gpio$switchled/direction;
    echo 1 > /sys/class/gpio/gpio$switchled/value;
    
  fi

  ctr=$(($ctr+1));

  sleep 0.5;
done

echo "GPIO LED SWITCH ... end";
