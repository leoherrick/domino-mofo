require 'domino_mofo'
include DominoMofo

module SpecHelper
  class OneHumanPlayerMatcher
    def ==(actual)
      human_players = actual.find_all{|x| x.instance_of?(HumanPlayer)}
      human_players.length == 1
    end
  end

  class Output
    def messages 
      @messages ||= [] 
    end 
    def puts(message) 
      messages << message 
    end 
  end 
  def output 
    @output ||= Output.new 
  end

  class NumberOfComputerPlayersMatcher
  
    def initialize(expected)
      @expected = expected
    end
  
    def description
      "number of computer players matching #{@expected}"
    end
  
    def ==(actual)
      computer_players = actual.find_all{|x| x.instance_of?(ComputerPlayer)}
      computer_players.length == @expected
    end
  end

  def one_human_player
    OneHumanPlayerMatcher.new 
  end 

  def number_of_computer_players expected_number
    NumberOfComputerPlayersMatcher.new(expected_number)
  end 

end