class Player
  attr_accessor :marker

  def initialize
    @winner = false
    @marker = ''
  end

  def choose_marker
    puts 'Would you like to be X or O?'
    @marker = gets.chomp
  end
end

class GameBoard
  def initialize
    @board_state = Array.new(3) { Array.new(3, '_') }
    @winning_board = ['X', 'X', 'X']
  end

  def check_for_winner(marker)
    # Check rows
    @board_state.each do |row|
      return true if row == [marker, marker, marker]
    end

    # Check columns
    (0..2).each do |col|
      column = @board_state.map { |row| row[col] }
      return true if column == [marker, marker, marker]
    end

    # Check diagonals
    diagonal1 = [@board_state[0][0], @board_state[1][1], @board_state[2][2]]
    diagonal2 = [@board_state[0][2], @board_state[1][1], @board_state[2][0]]
    return true if diagonal1 == [marker, marker, marker] || diagonal2 == [marker, marker, marker]

    false
  end

  def print_board
    @board_state.each { |row| puts row.join(' ') }
  end

  def update_board(marker, position)
    row, col = (position - 1) / 3, (position - 1) % 3
    if @board_state[row][col] == '_'
      @board_state[row][col] = marker
    else
      puts "Position already taken!"
    end
  end
end

class Game 
  def new_game
    newboard = GameBoard.new
    newboard.print_board
  end

  def players_turn(player)
    puts "#{player.marker}'s turn"
    puts 'Please choose a position based on this input:'
    puts '1,2,3'
    puts '4,5,6'
    puts '7,8,9'
    position = gets.chomp.to_i
    position
  end

  def play_game(player1, player2, board)
    loop do
      [player1, player2].each do |player|
        puts "#{player.marker}'s turn"
        position = players_turn(player)
        board.update_board(player.marker, position)
        board.print_board

        if board.check_for_winner(player.marker)
          puts "Player #{player.marker} wins!"
          return "Player #{player.marker} wins!"
        end
      end
    end
  end
end

# Main Game Setup
game = Game.new
player1 = Player.new
player2 = Player.new

player1.choose_marker
player2.marker = player1.marker == 'X' ? 'O' : 'X'

board = GameBoard.new
board.print_board

# Play the game
game.play_game(player1, player2, board)
