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


#NE MARCHE PAS!!!#
  def mark_fb(x, guess)
    white = []
    black = []
    for i in 0..3 do
      for x in 0..3 do
        if guess[i] == @code[i]
          white.push("o")
        elsif guess[i] == @code[x]
          black.push("o".colorize(:black))
        end
      end
      @fb[x] = (white + black)
    end
  end

end
