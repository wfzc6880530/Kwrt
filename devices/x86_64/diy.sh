#!/bin/bash

SHELL_FOLDER=$(dirname $(readlink -f "$0"))

# 编译优化：把 -Os 改成 -O2，提升性能，与具体源码无关
sed -i 's/Os/O2/g' include/target.mk

# ===== 以下原有操作已注释，原因：依赖 coolsnowwolf/lede 的 x86 文件与 6.12 内核补丁，
# ===== 与 ImmortalWrt 稳定分支内核版本不匹配，直接覆盖会导致编译失败。
# ===== 如果你的 ImmortalWrt 分支内核版本恰好是 6.12，且你确认需要 lede 的 x86 配置，
# ===== 可以逐项取消注释并测试。

# git_clone_path master https://github.com/coolsnowwolf/lede target/linux/x86/files target/linux/x86/patches-6.12
#
# wget -N https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/x86/base-files/etc/board.d/02_network -P target/linux/x86/base-files/etc/board.d/
# wget -N https://github.com/coolsnowwolf/lede/raw/refs/heads/master/target/linux/x86/Makefile -P target/linux/x86/
#
# sed -i -e "s/ autocore-x86//" \
#        -e "s/ usb-net-rtl8152-vendor/usb-net-rtl8152/" \
#        -e "s/ automount//" \
#        -e "s/6.18/6.12/" target/linux/x86/Makefile
#
# sed -i 's/kmod-r8169/kmod-r8168/' target/linux/x86/image/64.mk
#
# sed -i 's/256/1024/g' target/linux/x86/image/Makefile
