class Board

  attr_accessor :code

  ##A board is created, there is a secret spot to put the code to guess and the board where the guessing player can put down it's guess. 12 turn to guess, 4 pins wide.##
  def initialize
    @guess = [["o", "o", "o", "o"],["o", "o", "o", "o"],["o", "o", "o", "o"],["o", "o", "o","o"],["o", "o", "o", "o"],["o", "o", "o", "o"],["o", "o", "o", "o"],["o", "o", "o", "o"],["o", "o", "o", "o"],["o", "o", "o", "o"],["o", "o", "o", "o"],["o", "o", "o", "o"]]
    @fb = [[" ", " ", " ", " "],[" ", " ", " ", " "],[" ", " ", " ", " "],[" ", " ", " "," "],[" ", " ", " ", " "],[" ", " ", " ", " "],[" ", " ", " ", " "],[" ", " ", " ", " "],[" ", " ", " ", " "],[" ", " ", " ", " "],[" ", " ", " ", " "],[" ", " ", " ", " "]]
  end

  ##Display the board after each turn, including the feedback for each##
  def display
    puts "  Guesses" + "   feedback"
    puts " _________"
    for x in 0..11 do
      puts "| " + @guess[x][0].to_s + " " + @guess[x][1].to_s + " " + @guess[x][2].to_s + " " + @guess[x][3].to_s + " |" + @fb[x][0] + @fb[x][1] + @fb[x][2] + @fb[x][3]
    end
    puts " ¯¯¯¯¯¯¯¯¯"
  end

  def mark_board

  end

end
