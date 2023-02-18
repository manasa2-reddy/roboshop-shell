echo -e "\e[35mInstalling nginx\e[0m"
yum install nginx -y

echo -e[35MRemoving old content\e[om"
rm -rf /usr/share/nginx/html/*

echo -e "\e[35mDownloading Frontend content\e[om""]
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[35mExtracting Downloaded Frontend \e[om"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

echo -e "\e[35mCopying nginx config for Roboshop\e[om"
pwd
ls -l
cp config/nginx-roshop.conf /etc/nginx/default.d/roboshop.conf

echo -e "\e[35mEnabling nginx\e[om"
systemctl enable nginx

echo -e "\e[35mStarting nginx\e[om"
systemctl restart nginx

