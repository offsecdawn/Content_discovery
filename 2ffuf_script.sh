#!/bin/bash
if [ -z "$1"];
then
echo "Usage:./ffuf_script.sh wordlist"
exit
fi
#echo "./ffuf_script.sh" $1 $2
source ~/.bash_profile
for i in $(cat valid_http_urls.txt)
do
        echo $i
        ffuf -w $1 -u $i/FUZZ -mc 200,204,301,302,307 -t 500
done
