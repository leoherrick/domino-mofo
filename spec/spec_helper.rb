require 'domino_mofo'
include DominoMofo

class OneHumanPlayerMatcher
  def ==(actual)
    human_players = actual.find_all{|x| x.instance_of?(HumanPlayer)}
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

#boards
  #1-1 spinner w/ 1-2, 1-3, 1-4, and 1-5
  def one_one_pinwheel
    board = Board.new
    bc = BoardController.new(board)
    one_one = Double.new(1,1)
    one_two = Domino.new(1,2)
    one_three = Domino.new(1,3)
    one_four = Domino.new(1,4)
    one_five = Domino.new(1,5)
    bc.place_first(one_one)
    bc.add_domino_to_domino_on_board_by_suit(one_two, board.get_domino_with_ends(1,1), 1)
    bc.add_domino_to_domino_on_board_by_suit(one_three, board.get_domino_with_ends(1,1), 1)
    bc.add_domino_to_domino_on_board_by_suit(one_four, board.get_domino_with_ends(1,1), 1)
    bc.add_domino_to_domino_on_board_by_suit(one_five, board.get_domino_with_ends(1,1), 1)
    return board
  end