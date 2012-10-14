class User

	attr_accessor :name
	attr_accessor :hand
	attr_accessor :total

	def initialize(name, hand)
		@name = name
		@hand = Array.new
		@total = 100
		@bust = faulse
	end

	





