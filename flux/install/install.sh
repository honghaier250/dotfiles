#!/bin/sh

AppName=xflux
Package=xflux64.tgz
Path=/root/.dotfiles/flux/srcpkg

#判断是否已安装
if [ -f /usr/local/bin/$AppName ];then
    echo -e "Already Install: $AppName\n"
else
    #离线安装
        cd $Path
        tar -axvf $Package
        cp -a $Path/$AppName /usr/local/bin/
        rm -rf $Path/$AppName

        #判断是否成功安装
        if [ $?==0 ]; then
            echo -e "Install Success: $AppName\n"
        else
            echo -e "Install Failed: $Package\n"
        fi

fi

