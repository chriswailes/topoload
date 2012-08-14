module Topoload
	class << self
		def cpuid
			Java::org::chris::sched::CPU.get_id()
		end
		
		def get_affinity
			Java::org::chris::sched::CPU.get_affinity.to_a
		end
		
		def num_cpus(type = :online)
			if type == :configured
				@configured ||= Java::org::chris::sched::CPU.cpus_configured()
			else
				Java::org::chris::sched::CPU.cpus_online()
			end
		end
		
		def set_affinity(*ids)
			if ids.empty?
				Java::org::chris::sched::CPU.pin()
			else
				Java::org::chris::sched::CPU.set_affinity(ids.to_java(Java::int))
			end
		end
		alias :pin :set_affinity
	end
end
