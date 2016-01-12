#!/bin/sh

AppName=cscope
Package=cscope-15.6-6.ky3.x86_64.rpm
Path=/root/.dotfiles/cscope/srcpkg/

#判断是否已安装
if [ `rpm -qa | grep $AppName |wc -l` -ne 0  ];then
    echo -e "Already Install: `rpm -qa | grep $AppName`\n"
else
    cd $Path && rpm -ivh $Package

    #判断是否成功安装
    if [ $?==0 ]; then
        echo -e "Install Success: `rpm -qa | grep $AppName`\n"
    else
        echo -e "Install Failed: $Package\n"
    fi
fi
