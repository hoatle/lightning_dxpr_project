#!/bin/bash

# clean up
rm -rf vendor docroot composer.lock

composer config --global bearer.packages.dxpr.com $DXPR_ACCESS_TOKEN

# debug: check if cached by github action
curl https://packages.dxpr.com/8/p2/dxpr/dxpr_builder.json

composer install -vvv

# debug
# cat /tmp/cache/repo/https---packages.dxpr.com-8/provider-dxpr~dxpr-builder.json
