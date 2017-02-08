class Ai

  attr_reader :code

  #The AI serve multiple purpose, it can assume the role of both player#
  #(one at the time)#
  def initialize
    possible = ["o".colorize(:red), "o".colorize(:red), "o".colorize(:red),
      "o".colorize(:red), "o".colorize(:blue), "o".colorize(:blue),
      "o".colorize(:blue), "o".colorize(:blue), "o".colorize(:yellow),
      "o".colorize(:yellow),"o".colorize(:yellow), "o".colorize(:yellow),
      "o".colorize(:green), "o".colorize(:green), "o".colorize(:green),
      "o".colorize(:green), "o".colorize(:magenta), "o".colorize(:magenta),
      "o".colorize(:magenta), "o".colorize(:magenta), "o".colorize(:cyan),
      "o".colorize(:cyan), "o".colorize(:cyan), "o".colorize(:cyan)]
    @possible_solution = []
    @possible_solution = possible.combination.to_a
  end

  #Serve the Ai playing the CodeMaker to choose a code.#
  def choose_code
    @code = []
    4.times do
     @code.push($possible_color[(rand(0..5))])
    end
    @code
  end

  #Will serve the Ai to take a guess. Will look at the feedback and take#
  #guess#
  def choose_guess(turn)
    @guess = []
    if turn == 0
      @guess = @possible_solution[0]
  end

  def react_to_feedback(x)
  end

end
