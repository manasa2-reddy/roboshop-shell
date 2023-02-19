source common.sh

print_head "setup MongoDB repository"
cp ${code_dir}/config/mongodb.repo /etc/yum.repos.d/mongo.repo &>>${log_file}

print_head "Install MongoDB"
yum install mongodb-org -y &>>${log_file}

print_head"Update MongoDB listen Address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>${log_file}

print_head "Enable MongoDB"
systemctl enable mongod &>>${log_file}

print_head "start MongoDB Service"
systemctl restart mongod &>>${log_file}





