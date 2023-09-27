set -ex

apt-get update
apt-get install -y nginx apache2-html tzdata curl netcat suricata
rm -f /var/cache/apt/archives/*.rpm \
      /var/cache/apt/*.bin \
      /var/lib/apt/lists/*.*

cd /etc/nginx/sites-enabled.d && ln -s ../sites-available.d/default.conf .
ln -sf /dev/stdout /var/log/nginx/access.log
ln -sf /dev/stderr /var/log/nginx/error.log
sed -Ei 's/^([[:space:]]*listen[[:space:]]+)127.0.0.1(:80)/\18888/' \
            /etc/nginx/sites-available.d/default.conf

F=wallarm-4.6.16.x86_64.sh
curl https://meganode.webmonitorx.ru/4.6/${F} -O
sh ./${F} -- -b --skip-registration --skip-systemd
rm ${F}
find /opt/wallarm -type f | xargs sha256sum >> /node.sha256
find /usr -type f -name nginx -o -name 'ngx*' | xargs sha256sum >> /node.sha256
find /usr/lib64 -type d -name 'suricata*' | xargs -I% find % -type f ! -name '*.pyc' | xargs sha256sum >> /node.sha256
find /usr/bin -type f -name 'suricata*' | xargs sha256sum >> /node.sha256

cat /tmp/build/default_addon.conf >> /etc/nginx/sites-available.d/default.conf

cp -a -v /tmp/build/docker-entrypoint.sh /
cp -a -v /tmp/build/recheck.sh /
