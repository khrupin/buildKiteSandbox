#!/bin/bash

#runCommand="./gradlew clean test jacocoTestReport jacocoTestCoverageVerification"
runCommand="./gradlew clean"

eval "$runCommand"
testExitCode="$?"

exit $testExitCode
