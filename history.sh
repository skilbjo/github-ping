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

  echo ${result[@]}
}

generate_dates 2015

exit 0
