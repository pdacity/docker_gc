#!/bin/sh

while true; do
    echo "🔔   Docker was pruned everything older than $AGE !"
        docker system prune -f -a --filter until=$AGE
    echo
    if [ -n "$SLEEP" ]; then
        echo "💤   Now sleep, next check in $SLEEP ..."
        sleep "$SLEEP"
        echo
    else
        exit 0
    fi
done



