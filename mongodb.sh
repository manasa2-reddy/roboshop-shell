source common.sh

print_head :"setup MongoDB repository"
cp config mongodb.repo /etc/yum.repos.d/mongo.repo

print_head "Install MongoDB"
yum install mongodb-org -y

print_head "Enable MongoDB"
systemctl enable mongod

print_head "start MongoDB Service"
systemctl start mongod


#update /etc/mongod.conf file from 127.0.0.1 with 0.0.0.0


