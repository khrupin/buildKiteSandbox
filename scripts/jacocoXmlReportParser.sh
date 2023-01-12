#!/bin/bash

echo "--- Retrieve Jacoco XML Report"
buildkite-agent artifact download "buildKiteSandbox/mockBuildDir/reports/jacoco/*/*.xml" .

echo "--- Parse Report"
xmlReportFile=$(find . -name jacocoTestReport.xml)
echo "PATH_TO_XML_REPORT: ${xmlReportFile}"

wc -c xmlReportFile

#missedNodesStr= doc.xpath("/report/counter[@type='INSTRUCTION']/@missed")
missedNodesStr=$(xmllint --xpath "string(/report/counter[@type='INSTRUCTION']/@missed)" $xmlReportFile)
coveredNodesStr=$(xmllint --xpath "string(/report/counter[@type='INSTRUCTION']/@covered)" $xmlReportFile)
#coveredNodesStr = doc.xpath("/report/counter[@type='INSTRUCTION']/@covered")
echo $missedNodesStr
#echo $coveredNodesStr

#VERSION=$(xmllint --xpath 'string(/addon/@version)' $ADDON_XML)
