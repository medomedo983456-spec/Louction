#!/bin/bash

# Locution - أداة تتبع الموقع الحقيقي للهاتف
# المبرمج: SayerLinux
# الإيميل: SaudiSayer@gmail.com

# ألوان النص
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# التحقق من نظام التشغيل
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo -e "${RED}[!] هذه الأداة تعمل فقط على نظام لينكس!${NC}"
    exit 1
fi

# التحقق من وجود بايثون
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}[!] بايثون 3 غير مثبت على النظام!${NC}"
    echo -e "${YELLOW}[*] يرجى تثبيت بايثون 3 باستخدام الأمر:${NC}"
    echo -e "    sudo apt-get install python3 python3-pip"
    exit 1
fi

# طباعة شعار البرنامج
echo -e "${GREEN}"
cat << "EOF"
  _                     _   _             
 | |                   | | (_)            
 | |     ___   ___ _  _| |_ _  ___  _ __  
 | |    / _ \ / __| |/ / __| |/ _ \| '_ \ 
 | |___| (_) | (__|   <| |_| | (_) | | | |
 |______\___/ \___|_|\_\\__|_|\___/|_| |_|
                                          
EOF
echo -e "${NC}"

echo -e "${YELLOW}تطوير: ${BLUE}SayerLinux${NC}"
echo -e "${YELLOW}البريد الإلكتروني: ${BLUE}SaudiSayer@gmail.com${NC}"
echo -e "${YELLOW}=====================================================${NC}\n"

# تثبيت المتطلبات
echo -e "${BLUE}[*] جاري تثبيت المتطلبات...${NC}"
pip3 install -r requirements.txt

if [ $? -eq 0 ]; then
    echo -e "\n${GREEN}[+] تم تثبيت المتطلبات بنجاح!${NC}"
    
    # منح صلاحيات التنفيذ
    chmod +x locution.py
    echo -e "${GREEN}[+] تم منح صلاحيات التنفيذ للسكربت!${NC}"
    
    echo -e "\n${YELLOW}[*] لتشغيل الأداة، استخدم الأمر:${NC}"
    echo -e "    ./locution.py\n"
    echo -e "${YELLOW}[*] أو مع تحديد رقم الهاتف مباشرة:${NC}"
    echo -e "    ./locution.py -n +966501234567\n"
    
    echo -e "${GREEN}[+] تم تثبيت Locution بنجاح!${NC}"
else
    echo -e "\n${RED}[!] حدث خطأ أثناء تثبيت المتطلبات!${NC}"
    exit 1
fi