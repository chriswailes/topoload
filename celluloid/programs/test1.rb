require 'rubygems'
require 'celluloid'
require '../topoload'
require '../monkeys'

class Counter
  # This is all you have to do to turn any Ruby class into one which creates
  # Celluloid actors instead of normal objects
  include Celluloid

  # Now just define methods like you ordinarily would
  attr_reader :count

  def initialize
    @count = 0
  end

  def increment(n = 1)
    @count += n
  end
end

actor = Counter.new

puts actor.count

puts actor.increment
