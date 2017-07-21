#!/usr/bin/env bash

openssl aes-256-cbc -K ${encrypted_${SIGN_ID}_key} -iv ${encrypted_${SIGN_ID}_iv} -in codesigning.asc.enc -out codesigning.asc -d

gpg --batch --fast-import codesigning.asc

if test -z ${DEPLOY_PROJECTS]
then
    PROJECTS=""
else
    PROJECTS="-pl ${DEPLOY_PROJECTS}"
fi

./mvnw ${PROJECTS} --settings travis-support/travis-settings.xml -Dskip-Tests=true -P release -B deploy
