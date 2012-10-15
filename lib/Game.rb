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

		puts "And choose a number to bet on"
		user_choice = $stdin.gets.chomp.upcase


		#Can't get it to recognize drop_ball, says:
		#"undefined method error - doesn't like .pop"
		if (user_choice == @wheel.drop_ball)
			@user.total += (user_stake.to_i * 30)
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