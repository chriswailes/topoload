#!/usr/bin/jruby

require 'topoload'

puts Topoload.cpuid

Topoload.pin(0, 1)

puts Topoload.cpuid

Topoload.pin(3)

puts Topoload.cpuid
