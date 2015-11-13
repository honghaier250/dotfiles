#!/bin/sh

AppName=extundelete
Package=extundelete-0.1.8-2.fc13.x86_64.rpm
Path=/root/.dotfiles/extundelete/srcpkg/
DepPkg=libevent2
DepPkgPath=/root/.dotfiles/extundelete/srcpkg/

#判断是否已安装
if [ `rpm -qa | grep $AppName |wc -l` -ne 0  ];then
    echo -e "Already Install: `rpm -qa | grep $AppName`\n"
else
    #离线安装依赖包
    if [ !$DepPkg  ];then
        cd $DepPkgPath && rpm -ivh libevent2-2.0.21-1.1.x86_64.rpm
        #判断是否成功安装
        if [ $?==0 ]; then
            echo -e "Install Success: `rpm -qa | grep $DepPkg`\n"
        else
            echo -e "Install Failed: $DepPkg\n"
        fi
    fi

    #离线安装
    if [ `rpm -qa | grep $DepPkg |wc -l` -ne 0  ];then
        cd $Path && rpm -ivh $Package

        #判断是否成功安装
        if [ $?==0 ]; then
            echo -e "Install Success: `rpm -qa | grep $AppName`\n"
        else
            echo -e "Install Failed: $Package\n"
        fi
    fi
fi
