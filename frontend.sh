code_dir=$(pwd)
log_file=/tmp/roboshop.log
rm -f ${log_file}

echo -e "\e[35mInstalling nginx\e[0m"
yum install nginx -y &>>${log_file}

echo -e "\e[35MRemoving old content\e[om"
rm -rf /usr/share/nginx/html/* &>>${log_file}

echo -e "\e[35mDownloading Frontend content\e[om"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>${log_file}

echo -e "\e[35mExtracting Downloaded Frontend \e[om"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>>${log_file}

echo -e "\e[35mCopying nginx config for Roboshop\e[om"
cp ${code_dir}/config/nginx-roshop.conf /etc/nginx/default.d/roboshop.conf &>>${log_file}

echo -e "\e[35mEnabling nginx\e[om"
systemctl enable nginx &>>${log_file}

echo -e "\e[35mStarting nginx\e[om"
systemctl restart nginx &>>${log_file}
