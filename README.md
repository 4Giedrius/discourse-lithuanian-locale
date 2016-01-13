# Discourse Lithuanian Locale
Simple hack to add Lithuanian language to Discourse. 

## Translations
Newest translations can be found at https://www.transifex.com/discourse/discourse-org/language/lt/

## Usage

Edit your `app.yml` (by default located in `/var/discourse/containers`) file and in `hooks` part add second exec section to make sure that translations stay in the container after rebuild. 

It should look similar like this:
```ruby
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - mkdir -p plugins
          - git clone https://github.com/discourse/docker_manager.git
    - exec:
        cd: /tmp
        cmd:
          - git clone https://github.com/4Giedrius/discourse-locale-override.git locale
          - cp -rT locale/ /var/www/discourse/
          - cp -f locale/reload_i18n.sh /root/reload_i18n.sh
          - chmod +x /root/reload_i18n.sh
          - rm -rf locales
```

Rebuild your app by running `./launcher rebuild app`

SSH into container and recompile assets:
```bash
cd /var/discourse
./launcher ssh app
./reload_i18n.sh
exit
./launcher restart app
```
## Contributing
1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

## Credits
* https://github.com/lidel/discourse-locale-override
* https://github.com/taypo/discourse-turkish-i18n-kpn
