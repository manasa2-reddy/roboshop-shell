curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd roboshop
mkdir /app
rm -rf /app/*
curl -L -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip
cd /app
npm install
cp config/catalogue.service /etc/systemd/system/catalogue.service

systemctl daemon-reload
systemctl enable mongod
systemctl start mongod

cp config/mondod.repo /etc/yum.repos.d/mongodb.repo
yum install mongodb-org-shell -y


mongo --host mongodb.71.store </app/schema/catalogue.js