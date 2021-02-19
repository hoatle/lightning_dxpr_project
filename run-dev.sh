#!/bin/bash

# clean up
rm -rf vendor docroot composer.lock

composer config --global bearer.packages.dxpr.com $DXPR_ACCESS_TOKEN

# debug for composer 2 before: check if cached by github action
curl https://packages.dxpr.com/8/p2/dxpr/dxpr_builder.json

composer install -vvv

# debug for composer 2 after:

FILE=/tmp/cache/repo/https---packages.dxpr.com-8/provider-dxpr~dxpr-builder.json
if test -f "$FILE"; then
  echo "cat $FILE"
  cat $FILE
fi
