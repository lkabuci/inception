#! /bin/bash

set -x
# Create a user and group
useradd --user-group --create-home --shell /bin/bash "$FTP_USER"
echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd

# Add user to uerlist
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

# Create FTP dirs
mkdir -p /home/"$FTP_USER"/ftp_dir/upload
chmod 550 /home/"$FTP_USER"/ftp_dir
chmod -R 750 /home/"$FTP_USER"/ftp_dir/upload
chown -R "$FTP_USER": /home/"$FTP_USER"/ftp_dir

# For Error
# 500 OOPS: vsftpd: not found: directory given in
# 'secure_chroot_dir':/var/run/vsftpd/empty
mkdir -p /var/run/vsftpd/empty

# Create log files
touch /var/log/vsftpd.log
touch /var/log/xferlog

# Start tailing log files and print their contents to stdout
tail -f /var/log/vsftpd.log | tee /dev/stdout &
tail -f /var/log/xferlog | tee /dev/stdout &

exec "$@"
