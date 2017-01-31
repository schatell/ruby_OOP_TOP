class Ai

  attr_reader :code

  ##The AI serve multiple purpose, it can assume the role of both player(one at the time)##
  def initialize; end

  ##Serve the Ai playing the CodeMaker to choose a code.##
  def choose_code
    @code = []
    4.times do
     @code.push($possible_color[(rand(0..5))])
    end
    @code
  end

  ##Will serve the Ai to take a guess. Will look at the feedback and take guess##
  def choose_guess

  end

end
