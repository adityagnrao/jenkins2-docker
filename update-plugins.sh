#!/bin/bash

#checks if the Jenkins is up and creates a new list of plugins

if [ $(curl -s -w "%{http_code}" http://localhost:1990 -o /dev/null) == "200" ] 
then  
echo "Jenkins Server is Up"
curl -sSL "http://localhost:1990/pluginManager/api/xml?depth=1&xpath=/*/*/shortName|/*/*/version&wrapper=plugins" | perl -pe 's/.*?<shortName>([\w-]+).*?<version>([^<]+)()(<\/\w+>)+/\1 \2\n/g'|sed 's/ /:/' > plugins.txt_new
wcnew=$(cat plugins.txt_new | wc -l)
#echo $wcnew
wcorig=$(cat plugins.txt| wc -l)
#echo $wcorig
if [[ $wcnew -ge $wcorig ]];
then
mv plugins.txt  plugins.txt_bck
mv plugins.txt_new  plugins.txt
echo "success"
else
echo "please make sure that the original set of plugins are not removed, scooting"
echo "plugins.txt -$wcorig | plugins.txt_new -$wcnew"
fi
else
echo "please make sure the Jenkins server is up, scooting"
fi
