#Remove those comment when pushed to git#

require 'colorize'

require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'ai.rb'

class Game


  module Screen
    def self.clear
      print "\e[2J\e[f"
    end
  end

  #Launching the game require both player, the human player will choose what#
  #role he want to take. The Ai will assume the other.#
  def initialize
    $possible_color = ["red", "blue", "yellow", "green", "magenta", "cyan"]
    @board = Board.new
    @computer = Ai.new
    @secret_code = []
    Screen.clear
  end

  #Game.display_instruction will puts the game instructions in the command#
  #line.#
  def display_instruction
    puts "Start by choosing if you want to be the code-maker or the " +
     "code-guesser."
    puts " "
    puts "If you choose to be the code-maker, make a code and the computer code"
    puts "guesser will try to guess your code"
    puts " "
    puts "If you choose to be the code-guesser, the computer will generate a"
    puts "secret code that you need to guess."
    puts " "
    puts "Each guess is 4 pin long. You can choose between six color: red, blue,"
    puts "yellow, green, magenta and cyan."
    puts "After each guess, the computer will give you feedback."
    puts " "
    puts "A white circle indicate a correct pin color and placement"
    puts "A black one mean a correct color but wrong placement."
    puts "No pin mean a wrong answer."
    puts "Feedback is given for each pin in your guess."
    puts "You win the game if you can guess the code in 12 turn or less."
    puts "Good luck!"
    puts " "
    puts " "
  end

  def begin_game
    loop do
      puts "     ---Welcome to Mastermind!---"
      puts " "
      puts "-----------------------------------------"
      puts " ---Press 1 to be the code-guesser---"
      puts "  ---Press 2 to be  the code-maker---"
      puts "---Press 0 to display the instructions---"
      puts "-----------------------------------------"
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
            Screen.clear
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
      @board.store_code(@computer.code)
      @secret_code = @computer.code
      Screen.clear
      @board.display
      turn
    else
      @player.pick_code
      @board.store_code(@player.pick)
      Screen.clear
      @ai.choose_guess
    end
  end

  def turn
    for x in 0..11 do
      @player.take_guess(x)
      @board.mark_board(x, @player.guess)
      #@board.mark_fb(x, @player.guess)#
      Screen.clear
      @board.display
      game_end?(x)
    end
  end

  #If the comparaison between the board and the guess is right, the game end#
  def game_end?(x)

  end

end

newgame = Game.new
newgame.begin_game
