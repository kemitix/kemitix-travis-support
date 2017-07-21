#!/usr/bin/env bash

eval KEY=\$encrypted_${SIGN_KEY}_key
eval IV=\$encrypted_${SIGN_KEY}_iv
openssl aes-256-cbc -K ${KEY} -iv ${IV} -in codesigning.asc.enc -out codesigning.asc -d

gpg --batch --fast-import codesigning.asc

if test -z ${DEPLOY_PROJECTS}
then
    PROJECTS=""
else
    PROJECTS="-pl ${DEPLOY_PROJECTS}"
fi

./mvnw ${PROJECTS} --settings .travis-support/settings.xml -Dskip-Tests=true -P release -B deploy
