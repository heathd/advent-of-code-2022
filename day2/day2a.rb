require File.dirname(__FILE__) + "/round2a"
data = File.read(File.dirname(__FILE__) + "/input.txt").split("\n")
puts data.map {|l| RoundA.new(l).score}.inject(&:+)