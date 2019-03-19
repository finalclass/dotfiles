#!/bin/bash



while [[ $# -gt 0 ]]; do
    case $1 in
        -b|--build)
            BUILD="yes"
            ;;
        -p|--capass)
            CAPASS=$1
            ;;
        *)
            NODE=$1
         ;;
    esac
    shift
done

if [ -z "$CAPASS" ]; then
    echo "CAPASS env variable not set"
    exit 1
fi


if [ -z "$NODE" ]; then
    echo "NODE argument missing"
    echo "Usage:"
    echo "fc-deploy-backstage-to-cloudnode.sh NODE"
    echo "optional agument: -b|--build will run the build before deploy"
    echo "optional argument: -p|--capass cloudadmin password. You can set it in env variables as well" 
    exit 1
fi

cd ~/Documents/spotme/docker-devnode/backstage-app/

if [ "$BUILD" == "yes" ]; then
    docker-compose run bstg npm run gulp build:prod    
fi

docker-compose run -e DB_URL=https://cloudadmin:$CAPASS@$NODE.4pax.com/backstage bstg ./tools/deploy.js
