#!/bin/bash

sed -i '' 's/[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}/'$(date +%Y-%m-%d)'/g' README.md
perl -p -e 's/(Incremented: )([0-9]+)/"Incremented: ".($2+1)/ge' README.md

git commit -am "'$(date +%Y-%m-%d)'" ; git push

