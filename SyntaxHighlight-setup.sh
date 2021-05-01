#!/bin/bash
#
# Executes custom Bash init scripts

# shellcheck disable=SC1090
# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace # Uncomment this line for debugging purposes
curl -o SyntaxHighlight_GeSHi-REL1_35-0e4cce6.tar.gz https://extdist.wmflabs.org/dist/extensions/SyntaxHighlight_GeSHi-REL1_35-0e4cce6.tar.gz
tar -xzf SyntaxHighlight_GeSHi-REL1_35-0e4cce6.tar.gz -C /bitnami/mediawiki/extensions/
rm SyntaxHighlight_GeSHi-REL1_35-0e4cce6.tar.gz
cd /bitnami/mediawiki/extensions/SyntaxHighlight_GeSHi
composer install --no-dev
chmod a+x /bitnami/mediawiki/extensions/SyntaxHighlight_GeSHi/pygments/pygmentize
echo "wfLoadExtension( 'SyntaxHighlight_GeSHi' );" >> /bitnami/mediawiki/LocalSettings.php
