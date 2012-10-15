require 'lib/wheel'
require 'lib/user'

class Game

	def initialize(name)

		@wheel = Wheel.new
		#not using the @user variable, but I still think
		#we might might to.
		
		@user = User.new(name)

		@game_over = false

		play_game
	end

	def play_game

		# display game startup message, including user name
		puts "Welcome to our amazing Roulette table!\n"
		puts "You have a total balance of 1000\n"
		puts "Lets begin!"

		while @game_over == false
			spin_wheel
		end

		puts "game over"

	end


	def spin_wheel
		puts "Place your stake from 0-1000"
		user_stake = $stdin.gets.chomp.upcase

		if user_stake.to_i > @user.total
			puts "You don't have enough money, try again"
			return
		end

		puts "And choose a number or colour to bet on"
		user_choice = $stdin.gets.chomp.upcase

		if user_choice.upcase == "RED" or user_choice.upcase == "BLACK"
			user_bet_type = "colour"
		elsif user_choice.to_i <= 36 and user_choice.to_i >= 0
			user_bet_type = "number"
		else
			puts "Sorry, invalid entry"
			return				
		end

		puts "Ball landed on #{@wheel.drop_ball.display}"


		#Can't get it to recognize drop_ball, says:
		#"undefined method error - doesn't like .pop"
		if user_bet_type == "number" and (user_choice == @wheel.drop_ball.number)

			@user.total += (user_stake.to_i * 36)
			puts "Congrats you win!"

		elsif user_bet_type == "colour" and (user_choice.upcase == @wheel.drop_ball.colour.upcase)
			@user.total += (user_stake.to_i * 2)
			puts "Congrats you win!"
		
		else
			@user.total -= user_stake.to_i
				puts "Sorry, you lose"
		end



		if @user.total <= 0
			@game_over = true
			puts "BUST"
		else
			puts "You have #{@user.total} left"
		end

	end

end