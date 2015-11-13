#/bin/bash

##安装pip
#yum install python-pip 
#
##安装python依赖包
#pip install docopt pygments
#
##下载cheat源码
#git clone https://github.com/chrisallenlane/cheat.git
#
##安装cheat
#cd cheat && python setup.py install

AppName=cheat
Package=cheat
Path=/root/.dotfiles/cheat/srcpkg/cheat/
DepPkg=python-pip
DepPkgPath=/root/.dotfiles/cheat/srcpkg/dependent/

#判断是否已安装
if [ -f `whereis $AppName | awk '{print $2}'` ];then
    echo -e "Already Install: $AppName\n"
else
    #离线安装依赖包
    if [ !$DepPkg  ];then
        if [ `rpm -qa | grep $DepPkg |wc -l` -e 0  ];then
            cd $DepPkgPath && rpm -ivh *.rpm
        fi

        cd $DepPkgPath
        pip install argparse-1.4.0-py2.py3-none-any.whl wheel-0.26.0-py2.py3-none-any.whl
        pip install Pygments-2.0.2-py2-none-any.whl
        tar -zxvf docopt-0.6.2.tar.gz && cd docopt-0.6.2 && python setup.py install
        if [ $?==0 ]; then
            rm -rf /root/.dotfiles/cheat/srcpkg/dependent/docopt-0.6.2
        fi

        #判断是否成功安装
        if [ $?==0 ]; then
            echo -e "Install Success: `rpm -qa | grep $DepPkg`\n"
        else
            echo -e "Install Failed: $DepPkg\n"
        fi
    fi

    #离线安装
    if [ `rpm -qa | grep $DepPkg |wc -l` -ne 0  ];then
        cd $Path && python setup.py install

        #判断是否成功安装
        if [ $?==0 ]; then
            echo -e "Install Success: $AppName\n"
        else
            echo -e "Install Failed: $Package\n"
        fi
    fi

fi
