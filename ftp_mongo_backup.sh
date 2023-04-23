#!/bin/bash

# Set the date format for the backup filename
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# Set the backup directory
BACKUP_DIR="/path/to/backup/directory"

# Set the FTP server details
FTP_SERVER="ftp.example.com"
FTP_USER="username"
FTP_PASSWORD="password"
FTP_DIRECTORY="/path/to/ftp/directory"

# Create a compressed backup of all data on the MongoDB server
mongodump --gzip --archive=$BACKUP_DIR/mongodb_$DATE.gz

# Upload the backup file to the FTP server
curl -T $BACKUP_DIR/mongodb_$DATE.gz ftp://$FTP_USER:$FTP_PASSWORD@$FTP_SERVER/$FTP_DIRECTORY/
