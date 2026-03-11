#!/bin/bash
# 请在下方输入自定义命令(一般用来安装第三方插件)(可以留空)
# Please enter the custom command below (usually used to install third-party plugins) (can be left blank)
# git clone --depth=1 https://github.com/EOYOHOO/UA2F.git package/UA2F
# git clone --depth=1 https://github.com/EOYOHOO/rkp-ipid.git package/rkp-ipid
src-git sirpdboy https://github.com/sirpdboy/luci-app-adguardhome.git

# 建立自動修正 OpenSSL 引擎的腳本 (針對 Built-in AFALG 優化)
mkdir -p files/etc/uci-defaults
cat <<EOF > files/etc/uci-defaults/99-fix-openssl
#!/bin/sh
if [ -f "/etc/ssl/openssl.cnf" ]; then
    sed -i 's/^engines = engines_sect/#engines = engines_sect/' /etc/ssl/openssl.cnf
fi
exit 0
EOF
chmod +x files/etc/uci-defaults/99-fix-openssl
