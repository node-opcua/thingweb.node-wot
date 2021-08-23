#!/bin/sh

export PACKAGE_FOLDER=`pwd`/tmp
mkdir -p $PACKAGE_FOLDER

cd ../packages/td-tools
echo "PACKAGE_FOLDER= ${PACKAGE_FOLDER}"

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
