#!/bin/bash
# 请在下方输入自定义命令(一般用来安装第三方插件)(可以留空)
# Please enter the custom command below (usually used to install third-party plugins) (can be left blank)
# git clone --depth=1 https://github.com/EOYOHOO/UA2F.git package/UA2F
# git clone --depth=1 https://github.com/EOYOHOO/rkp-ipid.git package/rkp-ipid

# 请在下方输入自定义命令(一般用来安装第三方插件)(可以留空)
# Please enter the custom command below (usually used to install third-party plugins) (can be left blank)

# 1. 先從 .config 中徹底刪除任何有關 RUST_DOWNLOAD_CI_LLVM 的舊設定
sed -i '/CONFIG_RUST_DOWNLOAD_CI_LLVM/d' .config

# 2. 強制寫入關閉該選項的設定
echo "# CONFIG_RUST_DOWNLOAD_CI_LLVM is not set" >> .config

# (可選) 預防萬一，連帶把 Rust 的 nightly/beta 頻道偏好也清一下，確保使用穩定版流程
sed -i '/CONFIG_RUST_USE_NIGHTLY/d' .config
