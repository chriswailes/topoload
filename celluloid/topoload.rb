module Topoload
	class << self
		def cpuid
			Java::org::chris::sched::CPU.get_id()
		end
		
		def num_cpus(type = :online)
			if type == :configured
				Java::org::chris::sched::CPU.cpus_configured()
			else
				Java::org::chris::sched::CPU.cpus_online()
			end
		end
		
		def pin(*ids)
			if ids.empty?
				Java::org::chris::sched::CPU.pin()
			else
				Java::org::chris::sched::CPU.pin(ids.to_java(Java::int))
			end
			
#			case overloaded
#			when nil		then Java::org::chris::sched::CPU.pin()
#			when Fixnum	then Java::org::chris::sched::CPU.pin(overloaded)
#			when Array	then Java::org::chris::sched::CPU.pin(overloaded.to_java(Java::int))
#			end
		end
		
		def tmp 
			Java::org::chris::sched::CPU.methods.sort
		end
	end
end
