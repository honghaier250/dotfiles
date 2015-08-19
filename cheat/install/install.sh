#/bin/bash

#安装pip
yum install python-pip 

#安装python依赖包
pip install docopt pygments

#下载cheat源码
git clone https://github.com/chrisallenlane/cheat.git

#安装cheat
cd cheat && python setup.py install


