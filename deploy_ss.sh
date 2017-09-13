#!/bin/bash
apt-get install -y python python-m2crypto supervisor

cd /tmp

wget https://bootstrap.pypa.io/get-pip.py

python get-pip.py

pip install shadowsocks

#pip install --upgrade pip #更新用

#pip install --upgrade shadowsocks  #更新用

mkdir -p /etc/shadowsocks/

cat > /etc/shadowsocks/shadowsocks.json <<EOF

{

        "server":"ip",

        "server_port":8088,

        "password":"123456",

        "timeout":300,

        "method":"aes-256-cfb",

        "fast_open":true

}

EOF

sleep 1s
cat > /etc/supervisor/conf.d/shadowsocks.conf <<EOF
[program:shadowsocks]
command=/usr/local/bin/ssserver -c /etc/shadowsocks/shadowsocks.json
autorestart=true
user=nobody
EOF
sleep 1s
invoke-rc.d supervisor restart
sleep 2s
service supervisor start

# git
sudo apt-get install git-core openssh-server openssh-client -y




