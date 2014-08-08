#/bin/bash

AppName=sdcv
Package=sdcv-0.4.2-8.el6.x86_64.rpm
Path=/root/.dotfiles/sdcv/srcpkg
DepPkg=stardict-langdao-ec-gb-2.4.2.tar.bz2
DepPkgPath=/root/.dotfiles/sdcv/srcpkg/stardict

#判断是否已安装
if [ `rpm -qa | grep $AppName |wc -l` -ne 0  ];then
    echo -e "Already Install: `rpm -qa | grep $AppName`\n"
else
    apt-get install  stardict sdcv stardict-common

    #判断是否成功安装
    if [ $?==0 ]; then
        echo -e "Install Success: `rpm -qa | grep $AppName`\n"
    else
        echo -e "Install Failed: $Package\n"
    fi

    #离线安装字典
    if [ -d /root/.dotfiles/sdcv/custom/.stardict ];then
        if [ -d /root/.dotfiles/sdcv/custom/.stardict/dic ];then
            cd $DepPkgPath
            tar -axvf stardict-langdao-ec-gb-2.4.2.tar.bz2 -C /root/.dotfiles/sdcv/custom/.stardict/dic
        else
            mkdir -p /root/.dotfiles/sdcv/custom/.stardict/dic
            tar -axvf stardict-langdao-ec-gb-2.4.2.tar.bz2 -C /root/.dotfiles/sdcv/custom/.stardict/dic
        fi
    else
        mkdir -p /root/.dotfiles/sdcv/custom/.stardict/dic
        tar -axvf stardict-langdao-ec-gb-2.4.2.tar.bz2 -C /root/.dotfiles/sdcv/custom/.stardict/dic
    fi

fi

