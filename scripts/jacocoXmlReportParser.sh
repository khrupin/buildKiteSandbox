#!/bin/bash

echo "--- Retrieve Jacoco XML Report"
buildkite-agent artifact download "buildKiteSandbox/mockBuildDir/reports/jacoco/*/*.xml" .

echo "--- Parse Report"
xmlReportFile=$(find . -name jacocoTestReport.xml)
echo "PATH_TO_XML_REPORT: ${xmlReportFile}"

wc -c $xmlReportFile


missedNodes=$(xmllint --xpath "string(/report/counter[@type='INSTRUCTION']/@missed)" $xmlReportFile)
coveredNodes=$(xmllint --xpath "string(/report/counter[@type='INSTRUCTION']/@covered)" $xmlReportFile)

echo "missed nodes count = $missedNodes"
echo "covered nodes count = $coveredNodes"

totalNodes=$(echo "$missedNodes+$coveredNodes" | bc)

codeCoveragePercentage=$(echo "r(($coveredNodes/$totalNodes)*100, 0)" | bc -l)

echo "code coverage percentage = $codeCoveragePercentage"
