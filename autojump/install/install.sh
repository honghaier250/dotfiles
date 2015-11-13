#!/bin/sh

AppName=autojump
Package=autojump-19-2.el6.noarch.rpm
Path=/root/.dotfiles/autojump/srcpkg/

#判断是否已安装
if [ `rpm -qa | grep $AppName |wc -l` -ne 0  ];then
    echo -e "Already Install: `rpm -qa | grep $AppName`\n"
else
    #离线安装依赖包
    if [ !$DepPkg  ];then
        cd $DepPkgPath && rpm -ivh $DepPkg
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
