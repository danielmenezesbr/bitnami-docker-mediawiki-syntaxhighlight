#!/bin/bash
#
# Executes custom Bash init scripts

# shellcheck disable=SC1090
# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace # Uncomment this line for debugging purposes
echo "wfLoadExtension( 'SyntaxHighlight_GeSHi' );" >> /bitnami/mediawiki/LocalSettings.php
