set -e
echo "Deploying to EID:$EID"
PACKAGE_DIR=`fc-package-dir.js`

cd $PACKAGE_DIR
NODE_TLS_REJECT_UNAUTHORIZED=0 DEBUG=fp* fp deploy $EID --ds $DS --yes
curl -s http://localhost.backstage.4pax.com/api/v1/eid/$EID/nodehandlers/_flush_cache
if [ $WEBAPP_ENABLED = true ] ; then
    curl -s $WEBAPP_URL/api/v1/eid/$EID/appscripts/_flush_cache
fi
printf "\n"
set +e
