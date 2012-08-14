require 'celluloid'
require 'topoload'

module Celluloid
	class Actor
		class << self
			alias :orig_new :new
			
			def new(subject)
				actor = orig_new(subject)
				
				puts "Created actor #{actor.hash} on CPU ##{Topoload.cpuid}."
			end
		end
		
		alias :orig_receive :receive
		
		def receive(*args, &block)
			puts "Actor #{self.hash} received a message."
		end
	end
end
