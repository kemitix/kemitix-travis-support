#!/usr/bin/env bash

echo "Publishing coverage"
if test -z ${COVERAGE_PROJECTS}
then
    PROJECTS=""
    echo " Projects: all"
else
    PROJECTS="-pl ${COVERAGE_PROJECTS}"
    echo " Projects: $COVERAGE_PROJECTS"
fi

./mvnw ${PROJECTS} test jacoco:report coveralls:report
