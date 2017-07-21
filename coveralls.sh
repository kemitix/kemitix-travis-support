#!/usr/bin/env bash

if test -z ${COVERAGE_PROJECTS]
then
    PROJECTS=""
else
    PROJECTS="-pl ${COVERAGE_PROJECTS}"
fi

./mvnw ${PROJECTS} test jacoco:report coveralls:report
