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

  def react_to_feedback(x, feedback)
    to_be_deleted = []
    @possible_solution.delete(@guess)
    if feedback.include?("o".colorize(:black))
      unless feedback.include?("o")
        #will delete any possible solution that have same colored pin at same#
        #place, since there is not a single white feedback#
        @possible_solution.each_with_index do |elem, index|
          for x in 0..3 do
            if @guess[x] == elem[x]
              to_be_deleted.push(index)
            end
          end
        end
      end
    else
      #Delete all possible solution that include old guess, since there is#
      #not a single feedback#
      @possible_solution.each_with_index do |elem, index|
        for x in 0..3 do
          if elem.include?(@guess[x])
            to_be_deleted.push(index)
          end
        end
      end
      #Once the list to be deleted is completed, will delete those index in#
      #the list of possible#
      to_be_deleted.each do |number|
        @possible_solution.delete_at(number)
      end
    end
    if feedback.include?("o")
      #If there is any white feedback, will try those that look alike#
      @possible_solution.each do |elem|
          if elem.include?(@guess[0..3])
            @best_available_guess = elem
          end
        end
      end
    else
      #If there is no clue will take the first possible solution in the list#
      @best_available_guess = @possible_solution[0]
  end

end
