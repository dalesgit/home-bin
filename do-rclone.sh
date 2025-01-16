#!/bin/bash

function mountGdrive {
	echo "mount Markdown folder"
	rclone mount gdrive: ~/gdrive
	return
}
function mountPcloud {
	echo "mount timimi wiki files"
	rclone mount Pcloud: ~/pcloud-drive
	return
}
function mountDropbox {
	echo "mount banking files"
	rclone mount Dropbox: ~/dropbox-drive
	return
}
function doPandoc {
echo "this is pandoc"
	/home/dale/bin/dopandoc.sh
}
