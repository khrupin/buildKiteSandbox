#!/bin/bash

xmlReportFile=$1

#missedNodesStr= doc.xpath("/report/counter[@type='INSTRUCTION']/@missed")
missedNodesStr=$(xmllint --xpath "string(/report/counter[@type='INSTRUCTION']/@missed)" $xmlReportFile)
coveredNodesStr=$(xmllint --xpath "string(/report/counter[@type='INSTRUCTION']/@covered)" $xmlReportFile)
#coveredNodesStr = doc.xpath("/report/counter[@type='INSTRUCTION']/@covered")
echo $missedNodesStr
#echo $coveredNodesStr

#VERSION=$(xmllint --xpath 'string(/addon/@version)' $ADDON_XML)
