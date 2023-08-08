URL=https://pda.5284.gov.taipei/MQS/StopLocationDyna?stoplocationid=
STOPLOCATIONID=8603

ID_645=21743
ID_902=27677

BUSID=$1

getTime() {
    DATA=$(curl -s ${URL}${STOPLOCATIONID})
    SEC=$(echo ${DATA} | jq ".Stop[] | select(.id==${1}).n1" | awk -F"," '{ print $8 }')
    echo $(($SEC / 60))
}

case "$BUSID" in
	645)
        getTime $ID_645
	;;
	902)
        getTime $ID_902
	;;
	*)
        echo "645: "$(getTime $ID_645)" mins"
        echo "902: "$(getTime $ID_902)" mins"
	;;
esac

