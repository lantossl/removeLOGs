#!/usr/bin/env bash

# for (( i = 0; i < 1000; i++ )); do
#   if [[ $i -lt "10" ]]; then
#     touch logs/T000000$i.LOG
#   else
#     touch logs/T00000$i.LOG
#   fi
# done

for i in $(seq -w $1 $2)
do
touch logs/T0000$i.LOG
done

exit
