#!/bin/bash
echo "--- Retrieve Jacoco XML Report"
buildkite-agent artifact download " **/mockBuildDir/reports/jacoco/*/*.xml" .

echo "--- Parse Report"
PATH_TO_XML_REPORT=$(find . -name *.xml)
echo "PATH_TO_XML_REPORT: ${PATH_TO_XML_REPORT}"

wc -c PATH_TO_XML_REPORT
