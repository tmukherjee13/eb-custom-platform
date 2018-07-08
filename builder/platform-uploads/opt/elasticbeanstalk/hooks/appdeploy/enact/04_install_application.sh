#Copyright 2003-2018 HyperSense Software SRL
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

set -xe

. /etc/NginxPlatform/platform.config

source ~/.profile
cd $LIVE_DIR
php init --env=Development --overwrite=a
export COMPOSER_HOME=/root
/usr/bin/composer update -v

if [ ! -d vendor/bower ]
then
    cp -r vendor/bower-asset vendor/bower
    chown -R webapp:webapp vendor
fi


if [ ! -d frontend/web/assets ]
then
    mkdir -p frontend/web/assets
    chown -R www-data:www-data frontend/web/assets
fi

if [ ! -d backend/web/assets ]
then
    mkdir -p backend/web/assets
    chown -R www-data:www-data backend/web/assets
fi