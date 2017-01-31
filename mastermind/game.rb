##Remove those comment when pushed to git##
##require_relative 'board.rb'##
##require_relative 'players.rb'##
##require_relative 'ai.rb'##
class Game

  ##Launching the game require both player, the human player will choose what role he want to take. The Ai will assume the other.##
  def initialize
    $possible_color = ["red", "blue", "yellow", "green", "purple", "orange"]
    @board = Board.new
    @computer = Ai.new
    @secret_code = []
  end

    ##Game.display_instruction will puts the game instructions in the command line.##
  def display_instruction
    puts "Start by choosing if you want to be the code-maker or the code-guesser."
    puts "If you choose to be the code-maker, make a code and the computer code guesser will try to guess your code"
    puts "If you choose to be the code-guesser, the computer will generate a secret code that you need to guess."
    puts "Each guess is 4 pin long. You can choose between six color: red, blue, yellow, green, purple and orange."
    puts "After each guess, the computer will give you feedback."
    puts "A white circle indicate a correct pin color and placement"
    puts "A black one mean a correct color but wrong placement."
    puts "No pin mean a wrong answer."
    puts "Feedback is given for each pin in your guess."
    puts "You win the game if you can guess the code in 12 turn or less."
    puts "Good luck!"
  end

  def begin_game
    loop do
      puts "---Welcome to Mastermind!---"
      puts "---Press 1 to be the code-guesser---"
      puts "---Press 2 to be  the code-maker---"
      puts "---press 0 to display the instructions---"
      loop do
        @choice = gets.to_i
        if @choice.between?(0,2)
          if @choice == 1
            @player = CodeBreaker.new
          end
          if @choice == 2
            @player = CodeMaker.new
          end
          if @choice == 0
            display_instruction
          end
        else
          puts "Please choose between 1 and 3"
        end
        break
      end
      break if @choice.between?(1,2)
    end
    if @player.class == CodeBreaker
      @computer.choose_code
      @secret_code = @computer.code
      @board.display
      turn
    else
      @player.pick_code
      @ai.choose_guess
    end
  end


  def turn
    12.times do
      @player.take_guess
      @board.mark_board()
    end
  end

    ##Serve to mark the board, 4 pins at a time.##
  def mark

  end

  ##Serve as a liaison between both player and the board. Will look at the guess taken by the CodeBreaker and compare it to the secret code on the board.
  def compare

  end

  ##If the comparaison between the board and the guess is right,
  def game_end

  end

  #Give feedback to guessing player, each exact guess get a white pin, each right color guess but wrong placement get a black pin##
  def feedback

  end

end

newgame = Game.new
newgame.begin_game
