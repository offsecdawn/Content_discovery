#!/bin/bash
if [ -z "$1"];
then
echo "Usage:./ffuf_script.sh $wordlist $http_file_name $response_code_to_filter"
exit
fi
#echo "./ffuf_script.sh" $1 $2
source ~/.bash_profile
for i in $(cat $2)
do
	echo $i
	ffuf -w $1 -u $i/FUZZ -fc $3 -t 500
done
