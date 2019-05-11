#!/bin/sh
#
#

for i in $(find ~/images/ -name '*.jpg')
do
	for img in $i
	do
		filename=$(basename "$img")
		post=$(wp post list --posts_per_page=1 --orderby=rand --format=ids --field=ID)
		wp media import $img --featured_image --post_id=$post
		echo "Image $filename assigned to post $post"
	done
done
