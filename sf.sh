#!/bin/bash

send_maple_dsds () {
cd ~/rom/out/target/product/maple_dsds


product=$(ls *maple_dsds*OFFICIAL*.zip)
#md5sum=$(ls *.md5sum)
project=xperia-xz-premium/CherishOS/twelve-one/maple_dsds

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
send \"bye\r\"
interact"
}


send_maple () {
cd ~/rom/out/target/product/maple


maple=$(ls *maple*OFFICIAL*.zip)
#maple_md5sum=$(ls *.md5sum)
project_maple=xperia-xz-premium/CherishOS/twelve-one/maple

# Upload
expect -c "
spawn sftp $SF_USERNAME@frs.sourceforge.net:/home/pfs/project/$project_maple
expect \"yes/no\"
send \"yes\r\"
expect \"Password\"
send \"$SF_PASS\r\"
set timeout -1
expect \"sftp>\"
send \"put $maple\r\"
expect \"Uploading\"
expect \"100%\"
expect \"sftp>\"
send \"bye\r\"
interact"
}

#send_maple_dsds
send_maple