#!/bin/bash

echo "This program has been developed to identify the URLS which are returning response code such as 200,301,302,403.The file should have https:// in it."
if [ -z "$1" ];
then
echo "Please provide httprobe file name to this script"
exit
fi
rm -f valid_http_urls.txt
for i in  $(cat $1)
do
	response_code=`curl -k -i --silent  $i --parallel-max 50 --connect-timeout 3 | tac| tac | head -n 1 | cut -d' ' -f2`
	echo $i $response_code
	 if [[ $response_code = 200 ]] || [[ $response_code = 301 ]] || [[ $response_code = 302 ]] || [[ $response_code = 403 ]]; then
	echo $i >> valid_http_urls.txt
	fi
done
