#!/bin/bash -x
#constants
STAKE=100
BET=1
#variables
noOfWinDay=0
noOfLossDay=0
#arrays
declare -A winArray
declare -A lossArray
count=0
dailyStake=$STAKE;
percentStake=$(((STAKE*50)/100))
function betCalculator(){
	STAKE=100
	noOfWins=0
	noofLoss=0
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
	if [ $STAKE -gt $dailyStake ]
	then
		winArray[$count]=$noOfWins
		lossArray[$count]=$noOfLoss
		((count++))
		((noOfWinDay++))
	else
		winArray[$count]=$noOfWins
		lossArray[$count]=$moOfLoss
		((count++))
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

function luckyDayFinder(){
lucky=${winArray[0]}
for i in ${winArray[@]}
do
     if [[ $i -gt $lucky ]]
     then
        lucky="$i"
     fi
done
for i in ${winArray[@]}
do
        ((countj++))
        if [[ $i -eq $lucky ]]
        then

                echo "the day lucky day was $countj with win of about $lucky times"
        fi
done
lucky=${lossArray[0]}
for i in ${lossArray[@]}
do
     if [[ $i -gt $lucky ]]
     then
        lucky="$i"
     fi
done
for i in ${lossArray[@]}
do
	((countk++))
	if [[ $i -eq $lucky ]]
	then

		echo "the unlucky day was $countk with loss for about $lucky times"
	fi
done
}
function nextMonthCheck(){
	if [ $noOfWinDay -gt $noOfLossDay ]
	then
		echo "you are eligible for next month also so enter 0 to continue or 1 to stop"
		read input
		if [ $input -eq 0 ]
		then
			for (( i=0;i<30;i++ ))
			do
				betCalculator
			done
			amountCalculator
			luckyDayFinder
			nextMonthCheck
		else
			echo "thanks for playing"
		fi
	else
		echo "you have loss more money plz stop playing for next month"
	fi
}
for (( i=0;i<30;i++ ))
do
betCalculator
done
amountCalculator
luckyDayFinder
nextMonthCheck
