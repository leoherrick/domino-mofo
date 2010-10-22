require 'domino_mofo'

class OneHumanPlayerMatcher
  def ==(actual)
    human_players = actual.find_all{|x| x.instance_of?(DominoMofo::HumanPlayer)}
    human_players.length == 1
  end
end

class AllButOneComputerPlayerMatcher
  def ==(actual)
    computer_players = actual.find_all{|x| x.instance_of?(DominoMofo::ComputerPlayer)}
    computer_players.length == actual.length - 1
  end
end


def one_human_player
  OneHumanPlayerMatcher.new 
end 

def all_but_one_computer_player
  AllButOneComputerPlayerMatcher.new 
end 
