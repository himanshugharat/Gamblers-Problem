#!/bin/bash -x
STAKE=100
BET=1
noOfWins=0
noOfLoss=0
noOfWinDay=0
noOfLossDay=0
dailyStake=$STAKE;
percentStake=$(((STAKE*50)/100))
function betCalculator(){
	STAKE=100
	dailyStake=$STAKE
	percentStake=$(((STAKE*50)/100))
	while [ $STAKE -gt $((dailyStake-percentStake)) ] && [ $STAKE -lt $((dailyStake+percentStake)) ]
	do
		result=$((RANDOM%2))

		if [ $result -eq 1 ]
		then
			STAKE=$((STAKE + BET))
			((noOfWins++))
		else
			STAKE=$((STAKE - BET))
			((noOfLoss++))
		fi
	done
	if [ $noOfWins -gt $noOfLoss ]
	then
		((noOfWinDay++))
	else
		((noOfLossDay++))
	fi
	echo "you have done for the days bet"
}

function amountCalculator(){
	if [ $noOfWinDay -gt $noOfLossDay ]
	then
		result=$((noOfWinDay*percentStake))
		echo "the individual won $noOfWinDay days an amount of $result"
	else
		result=$((noOfLossDay*percentStake))
		echo "the individual lost $noOfLossDay days an amount of $result"
	fi
}
for (( i=0;i<30;i++ ))
do
betCalculator
done
amountCalculator
