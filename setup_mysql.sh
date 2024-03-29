#!/bin/bash

# Tìm và sao chép mật khẩu tạm thời từ file log
temp_password=$(sudo grep 'password' /var/log/mysqld.log | awk '{print $NF}')

# Đổi mật khẩu thành 'PGaming@1107A'
mysql --user=root --password="$temp_password" --connect-expired-password --execute="ALTER USER 'root'@'localhost' IDENTIFIED BY 'PGaming@1107A';" && \

# Tạo database mới
mysql --user=root --password="PGaming@1107A" --execute="CREATE DATABASE IF NOT EXISTS server1;" && \

# Thực hiện lệnh GRANT trong môi trường MySQL
mysql --user=root --password="PGaming@1107A" --execute="GRANT ALL ON *.* to root@'%' IDENTIFIED BY 'PGaming@1107A';"
