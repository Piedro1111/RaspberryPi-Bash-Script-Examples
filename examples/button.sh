echo "AUTHOR: 	Bc. Peter Horváth";
echo "PROGRAM: 	Button";
echo "VERSION:	1.0";
echo "--------------------------";

read -p "Set GPIO out for all inputs: " outin;
read -p "Set GPIO in for left button: " setgpioleft;
read -p "Set GPIO in for right button:" setgpioright;

echo $outin > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio$outin/direction;
echo 1 > /sys/class/gpio/gpio$outin/value;

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
	  fi
  else
	  if [ $left -eq 1 ];
    then
	    echo "left";
	  fi
	  if [ $right -eq 1 ];
	  then
	    echo "right";
	  fi
  fi

  ctr=$(($ctr+1));

  sleep 1;
done

echo "GPIO Button ... end";
