#!/usr/bin/jruby

require 'topoload'

puts "CPU ID: #{Topoload.cpuid}"

puts "Pinning to [0, 1]."
Topoload.pin(0, 1)

puts "Affinity: [#{Topoload.get_affinity.join(', ')}]."

puts "CPU ID: #{Topoload.cpuid}"

puts "Pinning to [3]."
Topoload.pin(3)

puts "Affinity: [#{Topoload.get_affinity.join(', ')}]."

puts "CPU ID: #{Topoload.cpuid}"
