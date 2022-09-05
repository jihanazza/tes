#!/bin/bash

send_maple () {
cd ~/rom/out/target/product/gapps


product=$(ls *maple_dsds*OFFICIAL*.zip)
product_dsds=$(ls *maple_dsds*OFFICIAL*.zip)
#md5sum=$(ls *.md5sum)
project=nusantaraproject/maple

# Upload
expect -c "
spawn sftp $SF_USERNAME@frs.sourceforge.net:/home/pfs/project/$project
expect \"yes/no\"
send \"yes\r\"
expect \"Password\"
send \"$SF_PASS\r\"
set timeout -1
expect \"sftp>\"
send \"put $product\r\"
expect \"Uploading\"
expect \"100%\"
expect \"sftp>\"
send \"cd ../maple_dsds\r\"
expect \"sftp>\"
send \"put $product_dsds\r\"
expect \"Uploading\"
expect \"100%\"
expect \"sftp>\"
send \"bye\r\"
interact"
}

#send_maple_dsds
#send_maple