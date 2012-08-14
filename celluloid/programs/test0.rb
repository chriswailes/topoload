require 'java'
require 'affinity-1.6.jar'

puts Java::vanilla.java.affinity.CpuLayout.coreId()
