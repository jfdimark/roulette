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

	bets = []


	loop do 
			puts "Place your stake from 0-1000"
		user_stake = $stdin.gets.chomp.upcase


		if user_stake.to_i > @user.total
		puts "You don't have enough money, try again"
		return
		end

		puts "And choose a number or colour, odds or evens, or 1-18 or 19-36 to bet on"
		user_choice = $stdin.gets.chomp.upcase

		single_bet = { choice: user_choice, stake: user_stake }

		if user_choice.upcase == "RED" or user_choice.upcase == "BLACK"
			single_bet[:type] = "colour"
		elsif user_choice.upcase == "ODDS" or user_choice.upcase == "EVENS"
			single_bet[:type] = "type"
		elsif user_choice.upcase == "1-18" or user_choice.upcase == "19-36"
			single_bet[:type] = "position"
		elsif user_choice.to_i <= 36 and user_choice.to_i >= 0
			single_bet[:type] = "number"
		else
			puts "Sorry, invalid entry"
			return	
		end

		bets << single_bet

		puts "Another bet??? (Y/N)"
		again = $stdin.gets.chomp.upcase

		if again == "N"
			break
		end
	end

	puts bets



	puts "Spinning wheel"
	@wheel.spin


	puts "Ball landed on #{@wheel.drop_ball.display}"

	prev_user_total = @user.total

	bets.each do |bet|

		#Can't get it to recognize drop_ball, says:
		#"undefined method error - doesn't like .pop"
		if bet[:type] == "number" and (bet[:choice] == @wheel.drop_ball.number)

			@user.total += (bet[:stake].to_i * 36)
			# puts "Congrats you win!"

		elsif bet[:type] == "colour" and (bet[:choice].upcase == @wheel.drop_ball.colour.upcase)
			@user.total += (bet[:stake].to_i * 2)
			# puts "Congrats you win!"

		elsif bet[:type] == "type" and (bet[:choice].upcase == @wheel.drop_ball.type.upcase)
			@user.total += (bet[:stake].to_i * 2)
			# puts "Congrats you win!"

		elsif bet[:type] == "position" and (bet[:choice].upcase == @wheel.drop_ball.position.upcase)
			@user.total += (bet[:stake].to_i * 2)
			# puts "Congrats you win!"

		else
			@user.total -= bet[:stake].to_i
			# puts "Sorry, you lose"
		end

	end

	if @user.total > prev_user_total
		puts "You won money"
	elsif @user.total == prev_user_total
		puts "You broke even"
	else
		puts "You lost money"
	end



	if @user.total <= 0
	@game_over = true
	puts "BUST"
	else
	puts "You have #{@user.total} left"
	end

end

end