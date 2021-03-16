#!/bin/bash
os_str=`cat /etc/os-release  | grep '^ID='`
os1=${os_str#*=}
os2=${os1#\"}
os=${os2%\"}
os_types=("rhel" "ubuntu" "centos" "debian")
found=0
for value in "${os_types[@]}"
do
if [ ${value^^} = ${os^^} ]
then
found=1
echo "$value"
echo "done"
fi
done
if [ $found -eq 0 ]
then
echo "NOT FOUND"
i=0
for value in "${os_types[@]}"
do
echo "$i. $value"
i=$((i+1))
done
echo 
read -p "Select OS: " answer
ans=${answer^^}
if [ $ans = '0' ]
then
echo "${os_types[0]}"
echo "done"
elif [ $ans = '1' ]
then
echo "${os_types[1]}"
echo "done"
elif [ $ans = '2' ]
then
echo "${os_types[2]}"
echo "done"
elif [ $ans = '3' ]
then
echo "${os_types[3]}"
echo "done"
fi
fi