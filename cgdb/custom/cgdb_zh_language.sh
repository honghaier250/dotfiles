#!/bin/sh

cd /lib64
rm -rf libncurses.so.5 
ln -s /lib64/libncursesw.so.5.7 libncurses.so.5
