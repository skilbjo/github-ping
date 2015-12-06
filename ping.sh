#!/bin/bash

echo -n '# ' >> README.md 
date +'%m-%d-%Y' >> README.md
git commit -am 'auto' ; git push
