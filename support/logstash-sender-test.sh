#!/bin/bash

TEAM="huntercodexs"
ENV="manual"
TEST_TYPE="trace"
COUNTER=1

echo "TCP SENDER 45001:5000/tcp"
echo "env=$ENV,team=$TEAM,testType=$TEST_TYPE,spanNum=$COUNTER" | nc -u -w1 localhost 45001

echo "UDP SENDER 45000:5000/udp"
echo "env=$ENV,team=$TEAM,testType=$TEST_TYPE,spanNum=$COUNTER" | nc -u -w1 localhost 45000
