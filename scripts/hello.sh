#!/bin/bash
echo "--- Retrieve Jacoco XML Report"
buildkite-agent artifact download "buildKiteSandbox/mockBuildDir/reports/jacoco/*/*.xml" .

echo "--- Parse Report"
PATH_TO_XML_REPORT=$(find . -name jacocoTestReport.xml)
echo "PATH_TO_XML_REPORT: ${PATH_TO_XML_REPORT}"

wc -c $PATH_TO_XML_REPORT
ruby scripts/jacocoXmlReportParser.rb $PATH_TO_XML_REPORT
