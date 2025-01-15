#!/bin/bash
# Looping over files, forging new filename, and then renaming it.
# Spaces will be replaced by underscores (_).
for oldname in * 
do 
  newname=`echo $oldname | sed -e 's/ /_/g'` 
  mv "$oldname" "$newname" 
done
# Spaces are now underscores

