#!/bin/bash

# Reload Prometheus YML Configurations (SIGHUP)
echo -n "Prometheus configurations reload "
sleep 2
pgrep prometheus | xargs -i kill -HUP {}
echo "[OK]"
exit
