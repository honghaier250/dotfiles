#!/bin/sh

AppName=terminator
Package=terminator-0.95-2.el6.noarch.rpm
Path=/root/.dotfiles/terminator/srcpkg/

#判断是否已安装
if [ `rpm -qa | grep $AppName |wc -l` -ne 0  ];then
    echo -e "Already Install: `rpm -qa | grep $AppName`\n"
else
    #判断是否连网
    ping -c 1 www.baidu.com > /dev/null
    if [ $? -e 0 ]; then
        #在线安装
        if [ `rpm -qa | grep epel-release |wc -l` -ne 0  ];then
            yum install -y $AppName
        else
            rpm -ivh http://dl.Fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
            yum install -y $AppName
        fi

        #判断是否成功安装
        if [ $?==0 ]; then
            echo -e "Install Success: `rpm -qa | grep $AppName`\n"
        else
            echo -e "Install Failed: $Package\n"
        fi

    else

        #离线安装
        cd $Path && rpm -ivh $Package

        #判断是否成功安装
        if [ $?==0 ]; then
            echo -e "Install Success: `rpm -qa | grep $AppName`\n"
        else
            echo -e "Install Failed: $Package\n"
        fi
    fi
fi
