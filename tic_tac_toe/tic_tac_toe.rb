class PlayScreen

  attr_accessor :board

  def initialize
    @board = [[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]]
  end

  def display
    puts "colunm " + "0  1  2"
    puts "row 0 " + " " + @board[0][0].to_s + "  " + @board[0][1].to_s +
     "  " + @board[0][2].to_s
    puts "row 1 " + " " + @board[1][0].to_s + "  " + @board[1][1].to_s +
     "  " + @board[1][2].to_s
    puts "row 2 " + " " + @board[2][0].to_s + "  " + @board[2][1].to_s +
     "  " + @board[2][2].to_s
  end

  def free_pos?(grid)
    @board[grid[0]][grid[1]].nil?
  end

  def mark_pos(grid, symbol)
    @symbol = symbol.to_s
    @board[grid[0]][grid[1]] = @symbol
  end

end

class Player

  attr_reader :turn_grid

  def initialize(symbol)
    @symbol = symbol.upcase
  end

  def move
      @turn_grid = Array.new
      loop do
        puts "It's " + @symbol.to_s + " turn. Please chose the row of your
        move, between 0 and 2."
        @pos1 = (gets.chomp.to_i)
        break if @pos1.between?(0,2)
      end

      @turn_grid.push(@pos1)

      loop do
        puts "And what column? Between 0 and 2."
        @pos2 = (gets.chomp.to_i)
        break if @pos2.between?(0,2)
      end

      @turn_grid.push(@pos2)

      return @turn_grid
  end

end

class Game

  def initialize
    @current_player = "X"
    @newgame = PlayScreen.new
    @x = Player.new("X")
    @y = Player.new ("O")
    @game_won = FALSE
  end

  def turn
    @newgame.display

    while @game_won == FALSE do
      if @current_player == "X"
        @x.move
        if @newgame.free_pos?(@x.turn_grid) == TRUE
          @newgame.mark_pos(@x.turn_grid, "X")
          @newgame.display
          @current_player = "O"
        else
          puts "Position already taken, please retake your turn."
          @x.move
        end
      else
        @y.move
        if @newgame.free_pos?(@y.turn_grid)
          @newgame.mark_pos(@y.turn_grid, "O")
          @newgame.display
          @current_player = "X"
        else
          puts "Position already taken, please retake your turn."
          @y.move
        end
      end
    end
  end

  def score
    score = [0, 0, 0]
  end

  def victory

  end

end

game = Game.new

game.turn
