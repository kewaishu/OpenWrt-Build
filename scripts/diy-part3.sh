#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part3.sh
# Description: OpenWrt DIY script part 3 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.66.1/g' package/base-files/files/bin/config_generate

# Add luci-app-ssr-plus
#pushd package/lean
#git clone --depth=1 https://github.com/fw876/helloworld
#popd

# Clone community packages to package/community
#mkdir package/community
#pushd package/community

# Add Lienol's Packages
#git clone --depth=1 https://github.com/Lienol/openwrt-package

# Add Kenzok8's Packages
git clone --depth=1 https://github.com/kenzok8/openwrt-packages

# Add luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall

# Add luci-app-vssr <M>
#git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git
#git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr

# Add OpenClash
#git clone --depth=1 -b master https://github.com/vernesong/OpenClash

# Add luci-app-onliner
#git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# Add luci-theme-argon
#git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
#git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
#rm -rf ../lean/luci-theme-argon

# Add luci-theme-edge
#git clone --depth=1 https://github.com/garypang13/openwrt-packages/tree/master/luci-theme-edge
#rm -rf ../lean/luci-theme-argon

# Add subconverter
#git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter

# Add luci-udptools
#git clone --depth=1 https://github.com/zcy85611/openwrt-luci-kcp-udp

# Add OpenAppFilter
#git clone --depth=1 https://github.com/destan19/OpenAppFilter

# Mod zzz-default-settings & Delete default password
#pushd package/lean/default-settings/files
#sed -i '/http/d' zzz-default-settings
#export orig_version="$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')"
#sed -i "s/${orig_version}/${orig_version} ($(date +"%Y-%m-%d"))/g" zzz-default-settings && sed -i "/CYXluq4wUazHjmCDBCqXF/d" zzz-default-settings
#popd

# Use Lienol's https-dns-proxy package
#pushd feeds/packages/net
#rm -rf https-dns-proxy
#svn co https://
#popd

# Use snapshots' syncthing package
#pushd feeds/packages/utils
#rm -rf syncthing
#svn co https://
#popd

# Change default shell to zsh
#sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# Add Other Packages
git clone https://github.com/sirpdboy/NetSpeedTest.git package/lean/NetSpeedTest
git clone https://github.com/esirplayground/luci-app-poweroff.git package/lean/luci-app-poweroff
git clone https://github.com/sirpdboy/luci-app-autotimeset.git package/lean/luci-app-autotimeset

# 取消bootstrap为默认主题 & Add luci-theme-rosy & luci-theme-atmaterial_new
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
#git clone https://github.com/rosywrt/luci-theme-rosy.git package/lean/luci-theme-rosy
git clone https://github.com/aswifi/luci-theme-atmaterial_new.git package/lean/luci-theme-atmaterial_new
rm -rf package/lean/luci-theme-bootstrap
#rm -rf package/lean/luci-theme-argon

# Mod zzz-default-settings & Modify the version number & Delete default password
pushd package/lean/default-settings/files
sed -i '/http/d' zzz-default-settings
export orig_version="$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')"
sed -i "s/OpenWrt /Redmi-AC2100 build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" zzz-default-settings
sed -i "/CYXluq4wUazHjmCDBCqXF/d" zzz-default-settings
