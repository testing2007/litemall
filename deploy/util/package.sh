#!/bin/bash

# 请注意
# 本脚本的作用是把本项目编译的结果保存到deploy文件夹中
# 1. 把项目数据库文件拷贝到deploy/db
# 2. 编译litemall-admin
# 3. 编译litemall-all模块，然后拷贝到deploy/litemall

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd $DIR/../..
LITEMALL_HOME=$PWD
echo "LITEMALL_HOME $LITEMALL_HOME"

# 复制数据库
cat $LITEMALL_HOME/litemall-db/sql/litemall_schema.sql > $LITEMALL_HOME/deploy/db/litemall.sql
cat $LITEMALL_HOME/litemall-db/sql/litemall_table.sql >> $LITEMALL_HOME/deploy/db/litemall.sql
cat $LITEMALL_HOME/litemall-db/sql/litemall_data.sql >> $LITEMALL_HOME/deploy/db/litemall.sql

# 打包litemall-admin
cd $LITEMALL_HOME/litemall-admin
npm install --registry=https://registry.npm.taobao.org
npm run build:dep

# 打包litemall-vue
# cd $LITEMALL_HOME/litemall-vue
# npm install --registry=https://registry.npm.taobao.org
# npm run build:dep

cd $LITEMALL_HOME
mvn clean package
cp -f $LITEMALL_HOME/litemall-all/target/litemall-all-*-exec.jar $LITEMALL_HOME/deploy/litemall/litemall.jar