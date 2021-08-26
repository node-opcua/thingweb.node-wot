#!/bin/sh
export HERE=`pwd`/`dirname "$0"`

export PACKAGE_FOLDER=${HERE}/tmp

cd ${HERE}
mkdir -p $PACKAGE_FOLDER
echo "HERE          =${HERE}"
echo "PACKAGE_FOLDER=${PACKAGE_FOLDER}"

cd ${HERE}/../packages/td-tools

cd ../td-tools; npm pack ; mv *.tgz ${PACKAGE_FOLDER};
cd ../core; npm pack ; mv *.tgz ${PACKAGE_FOLDER};
cd ../cli; npm pack ; mv *.tgz ${PACKAGE_FOLDER};
cd ../binding-file; npm pack ; mv *.tgz ${PACKAGE_FOLDER}
cd ../binding-http; npm pack ; mv *.tgz ${PACKAGE_FOLDER}
cd ../binding-mqtt; npm pack ; mv *.tgz ${PACKAGE_FOLDER}
cd ../binding-coap; npm pack ; mv *.tgz ${PACKAGE_FOLDER}
cd ../binding-websockets; npm pack ; mv *.tgz ${PACKAGE_FOLDER}

cd $PACKAGE_FOLDER
cd ..
docker build -t sterfive/node-wot .
