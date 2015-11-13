#!/bin/sh

AppName=vissible-ibus
Package=vissible-ibus.tar.gz
Path=/root/.dotfiles/vissible-ibus/srcpkg

#判断是否已安装
if [ -f /usr/share/ibus-table/tables/vissible.db ];then
    echo -e "Already Install: $AppName\n"
else
    #离线安装
        cd $Path
        tar -zxvf $Package && cd $Path/$AppName
        cp vissible.db /usr/share/ibus-table/tables
        cp vissible.gif /usr/share/ibus-table/icons
        cp vissible.txt ~/
        cd $Path && rm -rf $AppName

        #判断是否成功安装
        if [ $?==0 ]; then
            echo -e "Install Success: $AppName\n"
        else
            echo -e "Install Failed: $Package\n"
        fi

fi
