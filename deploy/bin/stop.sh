#!/bin/bash

PID=$(ps -ef | grep litemall.jar | grep -v grep | awk '{ print $2 }')

# if [ ! -z "$PID" ]
if test -n "$PID"
then
    kill $PID
fi