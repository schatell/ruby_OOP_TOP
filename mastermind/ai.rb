class Ai

  attr_reader :code, :guess

  #The AI serve multiple purpose, it can assume the role of both player#
  #(one at the time)#
  def initialize
    @possible = ["red", "red", "red", "red", "blue", "blue", "blue", "blue",
    "yellow", "yellow", "yellow", "yellow", "green", "green", "green",
    "green", "magenta", "magenta", "magenta", "magenta", "cyan", "cyan", "cyan",
    "cyan"]
    @possible_solution = Array.new
    @possible_score = {}
  end

  def make_list
    @possible_solution = @possible.combination(4).to_a
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
      @best_available_guess = []
      @guess = ["red", "red", "blue", "blue"]
    else
      @guess = @best_available_guess
    end
  end

  def analyse_fb(feedback)
    @max_possible_point = 0
    feedback.each do |elem|
      if elem == "o"
        @max_possible_point += 2
      end
      if  elem == "o".colorize(:black)
        @max_possible_point += 1
      end
  end

  def calculate_point_system

    @possible_solution.each do |elem|
    end

  end

  def delete_old_guess
    @possible_solution.delete(@guess)
  end

  def order_by_best

  end

end
