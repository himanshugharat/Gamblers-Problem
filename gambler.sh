#!/bin/bash -x
STAKE=100
BET=1
dailyStake=$STAKE;
newStake=$(((STAKE*50)/100))
while [ $STAKE -gt $((dailyStake-newStake)) ] && [ $STAKE -lt $((dailyStake+newStake)) ]
do
	result=$((RANDOM%2))

	if [ $result -eq 1 ]
	then
		STAKE=$((STAKE + BET))
	else
		STAKE=$((STAKE - BET))
	fi
done
echo "you have done for the days bet"

