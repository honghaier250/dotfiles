#!/bin/sh

AppName=tmux
Package=tmux-1.9a-3.gf.el6.x86_64.rpm
Path=/root/.dotfiles/tmux/srcpkg/tmux-1.9/
DepName=libevent2
DepPkg=libevent2-2.0.21-1.1.x86_64.rpm
DepPkgPath=/root/.dotfiles/tmux/srcpkg/dependencies/

#判断是否已安装
if [ `rpm -qa | grep $AppName |wc -l` -ne 0  ];then
    echo -e "Already Install: `rpm -qa | grep $AppName`\n"
else
#    #判断是否连网
#    ping -c 1 www.baidu.com > /dev/null
#    if [ $?==0 ]; then
#        #在线安装
#        if [ `rpm -qa | grep epel-release |wc -l` -ne 0  ];then
#            yum install -y $AppName
#        else
#            rpm -ivh http://dl.Fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
#            yum install -y $AppName
#        fi
#
#        #判断是否成功安装
#        if [ $?==0 ]; then
#            echo -e "Install Success: `rpm -qa | grep $AppName`\n"
#        else
#            echo -e "Install Failed: $Package\n"
#        fi
#
#    else

        #离线安装依赖包
        if [ !$DepPkg  ];then
            if [ `rpm -qa | grep $DepName | wc -l` -ne 0  ];then
                echo -e "Already Install: `rpm -qa | grep $DepName`\n"
            else

                cd $DepPkgPath && rpm -ivh $DepPkg
                #判断是否成功安装
                if [ $?==0 ]; then
                    echo -e "Install Success: `rpm -qa | grep $DepName`\n"
                else
                    echo -e "Install Failed: $DepPkg\n"
                fi
            fi
        fi

        #离线安装
        if [ `rpm -qa | grep $DepName | wc -l` -ne 0  ];then
            cd $Path && rpm -ivh $Package

            #判断是否成功安装
            if [ $?==0 ]; then
                echo -e "Install Success: `rpm -qa | grep $AppName`\n"
            else
                echo -e "Install Failed: $Package\n"
            fi
        fi
#    fi
fi
