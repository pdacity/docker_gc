#!/bin/sh

while true; do
    echo "🔔   Docker was pruned everything older than $AGE and unused volumes !"
        docker system prune --force --all --filter until=$AGE --filter label!=$STICKY_LABEL 
        docker volume prune --force  
    echo
    if [ -n "$SLEEP" ]; then
        echo "💤   Now sleep, next check in $SLEEP ..."
        sleep "$SLEEP"
        echo
    else
        exit 0
    fi
done


