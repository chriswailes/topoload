require 'java'
java_import 'Topoload'

module Topoload0
	class << self
		def get_cpuid
			Java::Topoload.get_cpuid()
		end
	end
end

puts Topoload0.get_cpuid
