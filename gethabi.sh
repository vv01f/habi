#!/bin/bash
# fn for download with wget
function getWs {
	ws=$1 # url
	dn=$(echo $ws|cut -d/ -f3) # domain, expecting http[s]:// in url
	echo $(date +"%d.%m. %H:%M:%S")" recursive downloading files from "$ws", please wait…"
	which wget >/dev/null && wget --quiet --recursive  --page-requisites --html-extension --convert-links --restrict-file-names=windows --domains ${dn} --no-parent $ws || echo "wget required."
	echo $(date +"%d.%m. %H:%M:%S")" done."
}
# create/go to dir
dir=habi
if test $(pwd|rev|cut -d/ -f1|rev) != $dir; then
	mkdir -p ./$dir
	cd $dir
fi
# actual download
getWs https://www.offiziere.ch/trust-us/habi1/index.html
getWs https://www.offiziere.ch/trust-us/habi2/index.html
# less subdirectories
mv -f www.offiziere.ch/trust-us/* ./ 2>/dev/null
rm -rf mv www.offiziere.ch/
