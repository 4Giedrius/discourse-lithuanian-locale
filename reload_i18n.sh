#!/bin/bash

cd /tmp
git clone https://github.com/4Giedrius/discourse-lithuanian-locale.git
cp -rT discourse-lithuanian-locale/ /var/www/discourse/
cp -f discourse-lithuanian-locale/reload_i18n.sh /root/reload_i18n.sh
chmod +x /root/reload_i18n.sh
rm -rf discourse-lithuanian-locale
cd /var/www/discourse
sudo -u discourse RAILS_ENV=production bundle exec rake assets:clobber assets:precompile
