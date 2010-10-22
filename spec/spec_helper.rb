require 'domino_mofo'

class OneHumanPlayerMatcher
  def ==(actual)
    human_players = actual.find_all{|x| x.instance_of?(DominoMofo::HumanPlayer)}
    human_players.length == 1
  end
end

class NumberOfComputerPlayersMatcher
  
  def initialize(expected)
    @expected = expected
  end
  
  def description
    "number of computer players matching #{@expected}"
  end
  
  def ==(actual)
    computer_players = actual.find_all{|x| x.instance_of?(DominoMofo::ComputerPlayer)}
    computer_players.length == @expected
  end
end

def one_human_player
  OneHumanPlayerMatcher.new 
end 

def number_of_computer_players expected_number
  NumberOfComputerPlayersMatcher.new(expected_number)
end 
