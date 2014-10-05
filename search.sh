#!/bin/bash
#EXAMPLE USE 
# search.sh gcc #will search entire computer for gcc 

NAME=$1

sudo find / -name ${NAME} 
