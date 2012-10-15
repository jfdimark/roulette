=begin
The wheel should...

take on the attributes of numbers
Give an output when spun
The output should be random
=end

require 'lib/numbers'
require 'lib/spin'

class Wheel

	attr_accessor :wheel

	include SpinWheel


	def initialize
		@wheel = Array.new

			36.times do |i|
				n = i + 1
				@wheel << Numbers.new(n)
			end
		
		@wheel =  spin_wheel(@wheel)
	end


	def drop_ball
		return @wheel.pop
	end

	def test
		10
	end

end