class Board 
	attr_reader :board

	def initialize(player1, player2)
		@board = (1..9).to_a
		@Player_1 = player1
		@Player_2 = player2
		puts "Player 1 is %s, Player 2 is %s." % [player1.mark, player2.mark]
	end