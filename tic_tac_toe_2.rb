class Board 
	attr_reader :board

	def initialize(player1, player2)
		@board = (1..9).to_a
		@Player_1 = player1
		@Player_2 = player2
		puts "Player 1 is %s, Player 2 is %s." % [player1.mark, player2.mark]
	end

	def play
		sequence = [@player_1, @player_2]
		until draw?
			puts "Player % turn" % sequence.first.name
			put_marker(sequence.first.mark)
			if win?(sequence.first)
				puts "Player %s wins!" %sequence.first.name
				show_board
				return
			end
			sequence.rotate!
		end
		puts "it's a draw!"
	end

	def show_board
		puts '-' * 9
		@board.each_slice(3) { |x|} puts x.join(' | ') puts '-' * 9 }
	end

	def get_place
		while 
			place = gets.to_i - 1
			if ! place.between?(0,9)
				puts "Invalid move, use 1..9.  Please choose again!"
				next
			end
			break
		end
		return place
	end

	def free_space?(place)
		@board[place].is_a? Integer
	end