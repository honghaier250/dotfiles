#CMake最低版本要求
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

#定义工程名称
PROJECT(ENCRYPT)

#指定编译类型
SET(CMAKE_BUILE_TYPE DEBUG)
#指定CFLAG
SET(CMAKE_C_FLAGS_DEBUG "-g -Wall")
#指定源码列表
SET(SRC_LIST encrypt.c)

#打印相关消息消息
MESSAGE(STATUS "Project: encrypt")
MESSAGE(STATUS "Project Source Directory: "${PROJECT_SOURCE_DIR})
MESSAGE(STATUS "Project Build Directory:  " ${PROJECT_BINARY_DIR})

#指定生成的可执行文件名
ADD_EXECUTABLE(encrypt ${SRC_LIST})
#指定输出可执行文件路径
SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)

#指定链接路径
LINK_DIRECTORIES(/usr/local/ssl/lib)
#指定链接库
TARGET_LINK_LIBRARIES(encrypt libssl.so libcrypto.so)

#指定脚本安装路径
INSTALL(PROGRAMS encrypt.py DESTINATION bin)
