#!/bin/bash

eval `ssh-agent -s`

echo -n '# ' >> README.md 
date +'%m-%d-%Y' >> README.md
git commit -am 'auto' ; git push

kill $SSH_AGENT_PID

