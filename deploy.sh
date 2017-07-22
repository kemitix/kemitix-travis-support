#!/usr/bin/env bash

echo "Decrypting signing key"
eval KEY=\$encrypted_${SIGN_ID}_key
echo " Key: $KEY"
eval IV=\$encrypted_${SIGN_ID}_iv
echo " IV: $IV"
openssl aes-256-cbc -K ${KEY} -iv ${IV} -in codesigning.asc.enc -out codesigning.asc -d

echo "Loading signing key"
gpg --batch --fast-import codesigning.asc

if test -z ${DEPLOY_PROJECTS}
then
    PROJECTS=""
    echo "Deploying Projects: all"
else
    PROJECTS="-pl ${DEPLOY_PROJECTS}"
    echo "Deploying Projects: $DEPLOY_PROJECTS"
fi

./mvnw ${PROJECTS} --settings .travis-support/settings.xml -Dskip-Tests=true -P release -B deploy
