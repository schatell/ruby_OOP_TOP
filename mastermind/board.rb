class Board

  attr_reader :code
  attr_accessor :fb

  #A board is created, there is a secret spot to put the code to guess and#
  #the board where the guessing player can put down it's guess. 12 turn to#
  #guess, 4 pins wide.#
  def initialize
    @guess = [["o", "o", "o", "o"],["o", "o", "o", "o"],["o", "o", "o", "o"],
    ["o", "o", "o","o"],["o", "o", "o", "o"],["o", "o", "o", "o"],
    ["o", "o", "o", "o"],["o", "o", "o", "o"],["o", "o", "o", "o"],
    ["o", "o", "o", "o"],["o", "o", "o", "o"],["o", "o", "o", "o"]]
    @fb = [[" ", " ", " ", " "],[" ", " ", " ", " "],[" ", " ", " ", " "],
    [" ", " ", " ", " "],[" ", " ", " ", " "],[" ", " ", " ", " "],
    [" ", " ", " ", " "],[" ", " ", " ", " "],[" ", " ", " ", " "],
    [" ", " ", " ", " "],[" ", " ", " ", " "],[" ", " ", " ", " "]]
    @code = []
  end

  def store_code(x)
    for i in 0..3 do
      @code[i] = "o".colorize(x[i].to_sym)
    end
  end

  #Display the board after each turn, including the feedback for each#
  def display
    puts "  Guesses" + "   feedback"
    puts " _________"
    for x in 0..11 do
      puts "| " + @guess[x][0].to_s + " " + @guess[x][1].to_s + " " +
       @guess[x][2].to_s + " " + @guess[x][3].to_s + " |" +
       @fb[x][0].to_s + @fb[x][1].to_s + @fb[x][2].to_s + @fb[x][3]
     end
    puts " ¯¯¯¯¯¯¯¯¯"
  end

  def mark_board(turn, y)
    for i in 0..3 do
      @guess[turn][i] = "o".colorize(y[i].to_sym)
    end
  end

#NE MARCHE PAS ECRIT TROP DE NOIR!!!!#
  def mark_fb(guess, turn_num)
    white = 0
    black = 0
    y = 0
    z = 0
    guess_arr = []
    skip_code = [0, 1, 2, 3]
    for x in 0..3 do
      guess_arr.push("o".colorize(guess[x].to_sym))
    end
    for y in 0..3 do
      if guess_arr[y] == @code[y]
        white += 1
        guess_arr[y] = white
        skip_code.delete(y)
      end
    end
    skip_code.each do | elem |
      if guess_arr.include?@code[elem]
        black += 1
      end
    end
    white.times do
      @fb[turn_num].unshift("o")
    end
    black.times do
      @fb[turn_num].unshift("o".colorize(:black))
    end
  end

end
