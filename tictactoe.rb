#blank

class Player
  def initialize 
    @@winner = false
  end
end

class Game
  def initialize
    @@turn = 1
    @@board = ['_|_|_',
    '_|_|_',
    ' | | ']
  end
  def board
    @@board
  end
end

newgame = Game.new
puts newgame.board