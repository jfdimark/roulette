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
	attr_accessor :drop_ball

	include SpinWheel


	def initialize
		@wheel = Array.new

			36.times do |i|
				n = i + 1
				@wheel << Numbers.new(n)
			end
		spin
	end

	def spin
		@wheel.shuffle!
		@drop_ball = @wheel.first
	end

	def test
		10
	end

end