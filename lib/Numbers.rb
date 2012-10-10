class Numbers

	attr_accessor :number 
	attr_accessor :colour
	attr_accessor :type
	attr_accessor :position
	attr_accessor :display

	def initialize(number) 

		@number = number

		if number == 0
			@colour = "Green"
			@type = "evens"
		elsif number % 2 == 0
			@colour = "Black"
			@type = "evens"
		else
			@colour = "Red"
			@type = "odds"
		end

		@position = case number
			when 0 then "off_of_table"
			when 1..18 then "bottom_of_table"
			when 19..36 then "top_of_table"
		end

		@display = case number
			when 0 then "0"
			when 1..36 then "#{number}, #{colour.downcase}, #{type}"
		end
	end
end