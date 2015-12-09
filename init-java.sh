#!/bin/bash
all_server=$1

if [[ -z $1 ]];then
   echo '请输入服务器，for example: app10-111,app10-112'
   exit
fi
echo 'start'
server_list=${all_server//,/ }
for server in $server_list
do
ssh $server "mkdir -p /data1/logs/tomcat_logs/jieba-segment"
ssh $server "mkdir -p /data1/logs/tomcat_logs/cookie"
ssh $server "mkdir -p /data1/logs/tomcat_logs/little-service"
ssh $server "mkdir -p /data1/logs/tomcat_logs/drone-web"
ssh $server "mkdir -p /data1/logs/tomcat_logs/app-activation"
ssh $server "mkdir -p /data1/logs/tomcat_logs/touchweb"
ssh $server "mkdir -p /data1/logs/aps_logs/aps-usercenter"

ssh $server "ln -s /data1/logs/tomcat_logs/jieba-segment /home/www/java-deploy/tomcat/tomcat_instances/jieba-segment/logs"
ssh $server "ln -s /data1/logs/tomcat_logs/cookie /home/www/java-deploy/tomcat/tomcat_instances/cookie/logs"
ssh $server "ln -s /data1/logs/tomcat_logs/little-service /home/www/java-deploy/tomcat/tomcat_instances/little-service/logs"
ssh $server "ln -s /data1/logs/tomcat_logs/drone-web /home/www/java-deploy/tomcat/tomcat_instances/drone-web/logs"
ssh $server "ln -s /data1/logs/tomcat_logs/app-activation /home/www/java-deploy/tomcat/tomcat_instances/app-activation/logs"
ssh $server "ln -s /data1/logs/tomcat_logs/touchweb /home/www/java-deploy/tomcat/tomcat_instances/touchweb/logs"
ssh $server "ln -s /data1/logs/aps_logs/aps-usercenter /home/www/java-deploy/aps/aps_instances/aps-usercenter/logs"

ssh $server "chown evans:www-data -R /data1/logs/tomcat_logs"
ssh $server "chown evans:www-data -R /data1/logs/aps_logs"
done
echo 'end'
