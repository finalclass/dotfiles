function deploy-sac {
    export EID="34e6c0a772cc3cc6b847f91e00b29688"
    echo $EID
    fp deploy $EID
    curl http://euadmin.backstage.spotme.com/api/v1/eid/$EID/nodehandlers/_flush_cache
}

    
