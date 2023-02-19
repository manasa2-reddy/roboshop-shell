source common.sh

print_head "setup MongoDB repository"
cp config/mongodb.repo /etc/yum.repos.d/mongo.repo

print_head "Install MongoDB"
yum install mongodb-org -y

print_head"Udate MongoDB listen Address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
print_head "Enable MongoDB"
systemctl enable mongod

print_head "start MongoDB Service"
systemctl restart mongod





