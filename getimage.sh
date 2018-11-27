#!/usr/local/bin/zsh
wget $1 -O ~/i.txt
#url=`grep -E -o '(https:)(.|/|\w)*?\.(?:jpg|gif|png)' ~/i.txt | head -1`
grep -E -o '(https:)(.|/|\w)*?\.(jpg|gif|png)' ~/i.txt >> url1.txt
sort -u url1.txt | uniq >> url2.txt
grep -E -o '(https:)(.|/|\w)*?(-\d{2}/e35)(.|/|\w)*?\.(jpg|gif|png)' url2.txt >> url3.txt
#wget $url
for url in `cat url3.txt`
do
	wget $url -O ~/insImage/`openssl rand -base64 8`.${url:(-3)}
done
rm -f ~/i.txt url1.txt url2.txt url3.txt
