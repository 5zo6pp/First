#!/usr/bin/env ruby
require "csv"

mqid = Array.new
cqid = Array.new
i = 0

  CSV.foreach("MotherQuestion.csv") do | questionid |
    mqid[i] = questionid[0]
    cqid[i] = questionid[1]
    i += 1
  end

puts mqid
puts ""
puts cqid

csv = CSV.open("log.csv", "w")
csv.puts mqid
csv.close
