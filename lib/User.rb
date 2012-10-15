class User

	attr_accessor :total
	attr_accessor :name
	attr_accessor :bust


	def initialize(name)
		@name = name
		@total = 1000
		@bust = false
	end

end
