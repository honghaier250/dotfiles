source ./breakpoint_for_linux_kernel

handle SIGSEGV pass nostop noprint
handle SIGUSR1 pass nostop noprint
start ubd0=/root/srcpkg/filesystem/CentOS6.x-x86-root_fs mem=256m
