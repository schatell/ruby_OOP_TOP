class CodeMaker

  ##The Codemaker is a type of player, it is the one choosing the code at the beginning of the game. Once the code is chosen, the codemaker have not used before the start of another game.##
  def initialize
    @code_picked = []
  end

  def pick_code
    puts "Please choose a code composed of 4 consecutive pin. You can choose between red, blue, yellow, green, purple and orange."
    puts "Choose one color at the time, from left to right by writing the name of the color in the following line:"
    for i in 1..4 do
      loop do
        puts "Choose the color number " + i.to_s
        pick = gets.chomp.downcase
        if $possible_color.include? pick
          @code_picked.push(pick)
        else
          puts "Remember you can only choose between red, blue, yellow, green, purple and orange."
        end
          break if $possible_color.include? pick
      end
    end
  end

end

class CodeBreaker

  attr_reader :guess

  ##The CodeBreaker is a type of player. He is the main player of the game and take guess to break the code.##
  def initialize

  end

  def take_guess
    @guess = []
    puts "Please make your guess for the next turn. Enter one color per line "
    puts " Remember the available color are red, blue, yellow, green, purple and orange."
    for i in 1..4 do
      loop do
        puts "Please choose the color " + i.to_s
        x = gets.chomp.downcase
        if $possible_color.include? x
          guess.push(x)
        else
          puts "Please choose a valid color"
        end
        break if $possible_color.include? x
      end
    end

  end

end
