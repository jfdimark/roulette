class Numbers

	attr_accessor :number 
	attr_accessor :colour
	attr_accessor :type
	attr_accessor :position
	attr_accessor :display

	def initialize(n) 

		@number = n

		if @number == 0
			@colour = "Green"
			@type = "none"
		elsif @number % 2 == 0
			@colour = "Black"
			@type = "evens"
		else
			@colour = "Red"
			@type = "odds"
		end

		@position = case n
			when 0 then "off_of_table"
			when 1..18 then "bottom_of_table"
			when 19..36 then "top_of_table"
		end

		@display = case n
			when 0 then "0"
			when 1..36 then "#{number}, color #{colour.downcase}, and it is #{type}"
		end
	end
end