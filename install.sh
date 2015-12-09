#!/bin/bash
read -p "确认可以ssh至对方服务器root? ([y]/n): "
if [ "$REPLY" != "n" ]; then
    echo "开始安装环境……"    
    sleep 1
    ansible-playbook -i init-hosts init.yaml
    ansible-playbook -i init-hosts ulimit.yaml
    ansible-playbook -i init-hosts swappiness.yaml
    ansible-playbook -i init-hosts site.yaml
    
    #以下为php5.3升级至php5.5.25
#    ansible-playbook -i init-hosts php-up.yaml
fi
