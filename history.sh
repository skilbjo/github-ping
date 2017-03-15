#!/bin/bash

generate_dates() {
  year=$1
  start=$(gdate -d $year-01-01 +'%Y%m%d')
  end=$(gdate -d $year-12-31 +'%Y%m%d')

  local result=()

  while [ $start -le $end ]; do
    result+=($(gdate -d $start +'%Y-%m-%d'))
    start=$(gdate -d "$start +1 day" +'%Y%m%d')
  done

  push_github $result
}

push_github() {
  result=$1

  for d in ${result[@]}; do
    sed -i '' 's/[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}/'$d'/g' HISTORY.md
    perl -pi -e 's/(Incremented: )([0-9]+)/"Incremented: ".($2+1)/e' HISTORY.md
    git commit --date="$d" -am "'$d'" ; git push

  done
}

generate_dates 2012

exit 0
