class PlayScreen

  attr_accessor :board

  #Initialize a 2d array containing only nil value#
  def initialize
    @board = [[" ", " ", " "],[" ", " ", " "],[" ", " ", " "]]
  end

  #The display method display the @board array on a grid.#
  def display
    puts "Column " + "0 1 2"
    puts "Row 0 " + " " + @board[0][0].to_s + " " + @board[0][1].to_s +
     " " + @board[0][2].to_s
    puts "Row 1 " + " " + @board[1][0].to_s + " " + @board[1][1].to_s +
     " " + @board[1][2].to_s
    puts "Row 2 " + " " + @board[2][0].to_s + " " + @board[2][1].to_s +
     " " + @board[2][2].to_s
  end

  #Check if the desired move by the player is valid, return TRUE if it's empty.#
  def free_pos?(grid)
    @board[grid[0]][grid[1]] == " "
  end

  #After the value were checked using the free_pos? method, the mark_pos#
  #method is used to play the move desired by the player#
  def mark_pos(grid, symbol)
    @symbol = symbol.to_s
    @board[grid[0]][grid[1]] = @symbol
  end

end

class Player

  attr_reader :turn_grid

  #Make sure to initialize both player using upcase caracter#
  def initialize(symbol)
    @symbol = symbol.upcase
  end

  #This method is used to let the player choose the desired move. Can only be#
  #value between 0 and 2, those value get stored in the @turn_grid array#
  def move
      @turn_grid = Array.new
      loop do
        puts "It's " + @symbol.to_s + " turn. Please chose the row of your"
        puts "move, between 0 and 2."
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
  end

end

class Game

  #Each time a game is started, a board and both player are created. The game#
  #won tracker and the current player variable are both set. Then the board is#
  #displayed for the first time#
  def initialize
    @current_player = "X"
    @newgame = PlayScreen.new
    @x = Player.new("X")
    @y = Player.new ("O")
    @game_won = FALSE
    @newgame.display
    @winning_player = nil
    turn
  end

  #check_victory_condition look for a winning player and is called after each#
  #valid move made by a player. Change the value of the @game_won variable.#
  #Also attribute the winning player to the player that made the last move,#
  #becoming the winner#
  def check_victory_condition
    for i in(0..2)
      if @newgame.board[i][0] == @current_player &&
        @newgame.board[i][1] == @current_player &&
        @newgame.board[i][2] == @current_player
        @game_won = TRUE
        @winning_player = @current_player
      end
      if @newgame.board[0][i] == @current_player &&
        @newgame.board[1][i] == @current_player &&
        @newgame.board[2][i] == @current_player
        @game_won = TRUE
        @winning_player = @current_player
      end
    end

    if @newgame.board[0][0] == @current_player &&
      @newgame.board[1][1] == @current_player &&
      @newgame.board[2][2] == @current_player
      @game_won = TRUE
      @winning_player = @current_player
    end
    if @newgame.board[0][2] == @current_player &&
      @newgame.board[1][1] == @current_player &&
      @newgame.board[2][0] == @current_player
      @game_won = TRUE
      @winning_player = @current_player
    end

  end

  #Will look for a full board between each turn, when the board is full#
  #without victory, a tie is drawn.#
  def is_board_full?
    @is_full = TRUE
      for row in(0..2)
        for col in(0..2)
          if @newgame.board[row][col] == " "
            @is_full = FALSE
          end
        end
      end
    end

  #Check if the game end, if it does end, check which player won or if it's#
  #a tie. Ask the player for a newgame, if a positive answer is provided,#
  #the game will restart.#
  def game_end
    loop do
      if @is_full == FALSE
        puts "#{@winning_player} won the game! Congrats"
      else
        puts "The game end in a draw."
      end

      puts "Would you like to start over, yes or no?"
      @restart = gets.chomp.upcase

      until @restart == "YES" || @restart == "NO"
        puts "Please write yes or no"
        @restart = gets.chomp.upcase
      end
      if @restart == "YES"
        @current_player = "X"
        @newgame.board = [[" ", " ", " "],[" ", " ", " "],[" ", " ", " "]]
        @game_won = FALSE
        @newgame.display
        @winning_player = nil
        turn
      elsif @restart == "NO"
        puts "Ok"
      end
      break
    end
  end

  #The turn method use the player class and method to pass argument to the#
  #free_pos and mark_pos method. If the move is valid, the move is made and#
  #the turn get passed to the next player. The loop will only end if the game#
  #come to an end.#
  def turn

    loop do
      if @current_player == "X" && @game_won != TRUE && @is_full != TRUE
        loop do
          @x.move
          if @newgame.free_pos?(@x.turn_grid)
            @newgame.mark_pos(@x.turn_grid, "X")
            is_board_full?
            check_victory_condition
            @current_player = "O"
            @newgame.display
          else
            puts "Position already taken, please retake your turn."
          end
          break if @current_player == "O"
        end
      end

      if @current_player == "O" && @game_won != TRUE && @is_full != TRUE
        loop do
          @y.move
          if @newgame.free_pos?(@y.turn_grid)
            @newgame.mark_pos(@y.turn_grid, "O")
            is_board_full?
            check_victory_condition
            @current_player = "X"
            @newgame.display
          else
            puts "Position already taken, please retake your turn."
          end
          break if @current_player == "X"
        end
      end
      break if @game_won == TRUE || @is_full == TRUE
    end
  game_end
  end

end

game = Game.new
