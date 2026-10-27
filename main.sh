#!/bin/bash

# 確保腳本是以 root 權限執行
if [ "$EUID" -ne 0 ]; then
  echo "請使用 sudo 執行此腳本：sudo bash $0"
  exit 1
fi

echo "========== 開始自動安裝 RustDesk 1.5.0 =========="

# 1. 更新系統並安裝必要依賴
apt-get update
apt-get install -y wget curl

# 2. 從你自己的網域下載託管的 1.5.0 .deb 檔案
# 👈 請替換為你實際存放 .deb 的網址
DEB_URL="https://files.catbox.moe/h10uv8.deb" 

echo "正在從自建伺服器下載 RustDesk 1.5.0..."
wget -O /tmp/rustdesk.deb "$DEB_URL"

if [ $? -ne 0 ]; then
    echo "錯誤：無法從 $DEB_URL 下載檔案，請檢查網址是否正確。"
    exit 1
fi

# 3. 安裝 RustDesk
echo "正在安裝 RustDesk..."
apt-get install -y /tmp/rustdesk.deb

# 清理暫存檔
rm /tmp/rustdesk.deb

# 執行 RustDesk 配置命令
rustdesk --config ==Qfi0zczpHT4U2YxoXb4IjVwVmdQJmWxd1SJZTWFRnT5JUOwZnRRtCNiZmVDtWRiojI5V2aiwiIiojIpBXYiwiIiojI5FGblJnIsISM4EjL3IjL0MjL0ETMiojI0N3boJye
rustdesk
echo "========== RustDesk 1.5.0 安裝與設定完成！ =========="
echo "請在應用程式選單中開啟 RustDesk，並將 ID 與密碼提供給支援人員。"
