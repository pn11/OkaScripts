#/bin/bash
# Move NEF and JPG files to respective directory

if [ -d nef ]; then
    mkdir nef
fi

if [ -d jpg_org ]; then
    mkdir jpg_org
fi

mv *JPG jpg_org/
mv *NEF nef/
