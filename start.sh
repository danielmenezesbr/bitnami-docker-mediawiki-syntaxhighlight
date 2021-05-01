git clone https://github.com/danielmenezesbr/bitnami-docker-mediawiki-syntaxhighlight
cd bitnami-docker-mediawiki-syntaxhighlight
mkdir mariadb-data && sudo chmod o+w mariadb-data
mkdir mediawiki-data && sudo chmod o+w mediawiki-data
sudo docker-compose up -d
timeout 300 bash -c 'while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' 127.0.0.1:8080/wiki/Special:Version)" != "200" ]]; do sleep 5; done' || false
curl -s -L 127.0.0.1:8080/wiki/Special:Version | grep -o SyntaxHighlight
