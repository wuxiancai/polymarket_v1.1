#!/bin/bash

# 检查Chrome是否已经运行
if pgrep -x "chrome" > /dev/null
then
    echo "Chrome已经在运行"
else
    # 启动Chrome浏览器并开启远程调试
    google-chrome --remote-debugging-port=9222 --user-data-dir="$HOME/chrome-debug-profile" &
fi

# 等待Chrome完全启动
sleep 2

# 检查是否成功启动
if ! curl -s http://127.0.0.1:9222/json/version > /dev/null
then
    echo "Chrome启动失败，请检查安装和配置"
    exit 1
fi

echo "Chrome已启动并开启远程调试端口9222" 