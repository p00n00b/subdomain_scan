#!/bin/bash
#example ./sub_enum.sh google.com A
subfinder -d $1 > tmp.txt
cat tmp.txt | dnsgen - >> tmp.txt
massdns -r dns-resolvers.txt -t $2 -o S -w  out.txt tmp.txt
cat out.txt | sort -u > $1_domains.txt
subs.sh $1 bin/$1_domains.txt | httpx  -status-code -location -ip -o $1_httpx.txt
