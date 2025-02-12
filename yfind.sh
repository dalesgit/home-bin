#!/bin/bash

export find_cmd='@sh -c "run_find %1 %2 %3 %4 %5"'

export fpipe=$(mktemp -u --tmpdir find.XXXXXXXX)
mkfifo "$fpipe"

trap "rm -f $fpipe" EXIT

KEY=$RANDOM

function run_find {
    echo "6:@disabled@"
    if [[ $2 != TRUE ]]; then
        ARGS="-name '$1'"
    else
        ARGS="-regex '$1'"
    fi
    if [[ -n "$4" ]]; then
        dt=$(echo "$4" | awk -F. '{printf "%s-%s-%s", $3, $2, $1}')
        d1=$(date +%j -d $dt)
        d2=$(date +%j)
        d=$(($d1 - $d2))
        ARGS+=" -ctime $d"
    fi
    if [[ -n "$5" ]]; then
        ARGS+=" -exec grep -q -E '$5' {} \;"
    fi
    ARGS+=" -printf '%p\n%s\n%M\n%TD %TH:%TM\n%u/%g\n'"
    echo -e '\f' >> "$fpipe"
    eval find "$3" $ARGS >> "$fpipe"
    echo "6:$find_cmd"
}
export -f run_find

function xopen {
    xdg-open "$1" &> /dev/null
}
export -f xopen

exec 3<> $fpipe

yad --plug=$KEY --tabnum=1 --form --date-format="%Y-%m-%d" \
    --field=$"Name" '*' --field=$"Use regex:chk" 'no' \
    --field=$"Directory:dir" '' --field=$"Newer than:dt" '' \
    --field=$"Content" '' --field="yad-search:fbtn" "$find_cmd" &

yad --plug=$KEY --tabnum=2 --list --no-markup --dclick-action='bash -c "xopen %s"' \
    --text $"Search results:" --column=$"Name" --column=$"Size:sz" --column=$"Perms" \
    --column=$"Date" --column=$"Owner" --search-column=1 --expand-column=1 <&3 &

yad --paned --key=$KEY --button="yad-close:1" --width=700 --height=500 \
    --title=$"Find files" --window-icon="find"

exec 3>&-

