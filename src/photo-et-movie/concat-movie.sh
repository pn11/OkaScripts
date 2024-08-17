#!/bin/bash
# https://scrapbox.io/pn11/Concatenate_Movies_taken_by_Drive_Recorder_DRV-630

set -euxo pipefail

INPUTS=$*
OUTNAME=concat-$1-etc.mp4

for file in $(ls -1 $INPUTS)
do
    echo file \'$file\'
done > inputs-ffmpeg.txt

ffmpeg -f concat -safe 0 -i inputs-ffmpeg.txt -movflags use_metadata_tags -c:v copy -c:a aac $OUTNAME
ffmpeg -i $OUTNAME -movflags use_metadata_tags -filter_complex "[0:v]setpts=0.1*PTS[v];[0:a]atempo=10[a]" -map "[v]" -map "[a]" ${OUTNAME}-10x.mp4
