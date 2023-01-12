#!/usr/bin/ruby

require 'nokogiri'

doc = Nokogiri::XML(File.read(ARGV[0]))

missedNodesStr = doc.xpath("/report/counter[@type='INSTRUCTION']/@missed")
coveredNodesStr = doc.xpath("/report/counter[@type='INSTRUCTION']/@covered")

missed = Float("#{missedNodesStr}", exception: false)

covered = Float("#{coveredNodesStr}", exception: false)

if missed.nil? && covered.nil?
    p "oops. the report could not parsed"
else
    totalNodes = missed + covered

    totalCoveragePercentage = ((covered/totalNodes) * 100).round(2)
    p "Total Code Coverage #{totalCoveragePercentage}%"
end
