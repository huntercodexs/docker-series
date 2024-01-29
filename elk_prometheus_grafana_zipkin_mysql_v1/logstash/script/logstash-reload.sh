#!/bin/bash

# Reload Logstash Pipeline IO Configurations (SIGHUP)
echo -n "Logstash Pipeline IO Configurations reload "
sleep 2
ps -ef | grep logstash | grep jruby | grep -v grep | cut -d " " -f2-14 | sed -e 's/ //g' | xargs -i kill -HUP {}
echo "[OK]"
exit
