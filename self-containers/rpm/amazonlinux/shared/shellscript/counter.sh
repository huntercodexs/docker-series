#!/bin/bash

application=counter

count=0
break=4
while true;
do
    sleep 1
    echo "Running .... $count" >> /var/log/services/${application}/${application}.log
    count=$(expr ${count} \+ 1)

    if [[ ${count} -ge ${break} && ${break} -ge 0 ]]
    then
        echo "FINISHED" >> /var/log/services/${application}/${application}.log
        break
    fi
done

exit