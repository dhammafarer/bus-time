URL=https://pda.5284.gov.taipei/MQS/StopLocationDyna?stoplocationid=
STOPLOCATIONID=8603

BUSID=$1

getTime() {
    DATA=$(curl -s ${URL}${STOPLOCATIONID})
    SEC=$(echo ${DATA} | jq ".Stop[] | select(.id==${1}).n1" | awk -F"," '{ print $8 }')
    echo $(($SEC / 60))
}

case "$BUSID" in
	"645")
        getTime 21743
	;;
	"902")
        getTime 27677
	;;
	*)
        echo "645: "$(getTime 21743)" mins"
        echo "902: "$(getTime 27677)" mins"
	;;
esac

