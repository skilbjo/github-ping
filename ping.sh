#!/bin/bash

sed -i '' 's/[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}/'$(date +%Y-%m-%d)'/g' README.md
perl -pi -e 's/(Incremented: )([0-9]+)/"Incremented: ".($2+1)/e' README.md

#git commit -am "'$(date +%Y-%m-%d)'" ; git push

