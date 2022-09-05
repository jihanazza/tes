#!/bin/bash

send_maple () {
cd ~/rom/out/target/product/maple


product_vanilla=Nusantara-v4.8-12L-maple-04092022-OFFICIAL-1424.zip
product_gapps=Nusantara-v4.8-12L-maple-Gapps-04092022-OFFICIAL-1504.zip
product_dsds_vanilla=Nusantara-v4.8-12L-maple_dsds-04092022-OFFICIAL-1350.zip
product_dsds_gapps=Nusantara-v4.8-12L-maple_dsds-Gapps-04092022-OFFICIAL-1607.zip
#md5sum=$(ls *.md5sum)
project=znxt-project/maple

# Upload
expect -c "
spawn sftp $SF_USERNAME@frs.sourceforge.net:/home/pfs/project/$project
expect \"yes/no\"
send \"yes\r\"
expect \"Password\"
send \"$SF_PASS\r\"
set timeout -1
expect \"sftp>\"
send \"put $product_vanilla\r\"
expect \"Uploading\"
expect \"100%\"
expect \"sftp>\"
send \"put $product_gapps\r\"
expect \"Uploading\"
expect \"100%\"
expect \"sftp>\"
send \"cd ../maple_dsds\r\"
expect \"sftp>\"
send \"put $product_dsds_vanilla\r\"
expect \"Uploading\"
expect \"100%\"
expect \"sftp>\"
send \"put $product_dsds_gapps\r\"
expect \"Uploading\"
expect \"100%\"
expect \"sftp>\"
send \"bye\r\"
interact"
}

#send_maple_dsds
send_maple