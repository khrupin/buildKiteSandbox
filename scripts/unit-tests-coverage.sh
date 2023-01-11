#!/bin/bash

runCommand="./gradlew clean test jacocoTestReport jacocoTestCoverageVerification"

eval "$runCommand"
testExitCode="$?"

exit $testExitCode
