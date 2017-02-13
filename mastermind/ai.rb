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
      @guess = @next_guess
    end
  end

  def react_to_fb(feedback)
    delete_old_guess
    analyse_fb(feedback)
    delete_irrelevant_guess(@max_possible_point)
    calculate_point_system(@guess)
    order_by_best
  end

  def delete_old_guess
    @possible_solution.delete(@guess)
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
  end

  def delete_irrelevant_guess(fb_pts)
    pos_to_delete =[]
    if fb_pts == 0
      @possible_solution.each_with_index do |elem, index|
        for x in 0..3 do
          if elem.include?(@guess[x])
            pos_to_delete.push[index]
          end
        end
      end
    end
    pos_to_delete.each do |ind|
      @possible_solution.delete_at(ind)
    end
  end

  def calculate_point_system(guess)
    @best_available_guess = {}

    @possible_solution.each do |elem|
      maxpoint = @max_possible_point
      elempoint = 0
      for x in 0..3 do
        if @guess[x] == elem[x]
          maxpoint -= 2
          elempoint += 2
        end
        if elem.include?(@guess[x])
          maxpoint -= 1
          elempoint += 1
        end
        break if maxpoint == 0
      end
      @best_available_guess[elempoint] = elem
    end
  end

  def order_by_best
    @next_guess = []
    x = 0
    y = 0
    @best_available_guess.each do |points, guess|
      y = points
      if y > x
        @next_guess = guess
        x = points
      end
    end
    #@best_available_guess.each do |elem|#
      #puts elem.to_s#
    #end
  end

end
