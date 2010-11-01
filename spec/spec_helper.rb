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

  #boards  
  #1-1 spinner w/ 1-2, 1-3, 1-4, and 1-5
  def one_one_pinwheel
    board = Board.new
    bc = BoardController.new(board)
    one_one = Double.new(1)
    one_two = Domino.new(1,2)
    one_three = Domino.new(1,3)
    one_four = Domino.new(1,4)
    one_five = Domino.new(1,5)
    bc.lead_out(one_one)
    bc.play_domino_on_board_by_suit(one_two, board.find_domino_with_suits(1,1), 1)
    bc.play_domino_on_board_by_suit(one_three, board.find_domino_with_suits(1,1), 1)
    bc.play_domino_on_board_by_suit(one_four, board.find_domino_with_suits(1,1), 1)
    bc.play_domino_on_board_by_suit(one_five, board.find_domino_with_suits(1,1), 1)
    return board
  end

  #matches
  def setup_match_where_human_has_highest_double_to_leadout
    match = Match.new
    human_player = HumanPlayer.new(match)
    human_player.hand = Hand.new << Double.new(6) << Domino.new(6,0)
    cpu1 = ComputerPlayer.new(match)
    cpu1.hand = Hand.new << Domino.new(6,1)
    cpu2 = ComputerPlayer.new(match)
    cpu2.hand = Hand.new << Domino.new(6,2)
    cpu3 = ComputerPlayer.new(match)
    cpu3.hand = Hand.new << Domino.new(6,3)
    player_group = PlayerGroup.new << human_player << cpu1 << cpu2 << cpu3
    match.players[0] = human_player
    match.players[1] = cpu1
    match.players[2] = cpu2
    match.players[3] = cpu3
    match.change_output(output) 
    @match_controller = match.controller
  end
  
  def setup_match_where_cpu1_has_highest_double_to_leadout
    match = Match.new
    human_player = HumanPlayer.new(match)
    human_player.hand = Hand.new << Domino.new(6,0)
    cpu1 = ComputerPlayer.new(match)
    cpu1.hand = Hand.new << Double.new(6) << Domino.new(6,1)
    cpu2 = ComputerPlayer.new(match)
    cpu2.hand = Hand.new << Domino.new(6,2)
    cpu3 = ComputerPlayer.new(match)
    cpu3.hand = Hand.new << Domino.new(6,3)
    player_group = PlayerGroup.new << human_player << cpu1 << cpu2 << cpu3
    match.players[0] = human_player
    match.players[1] = cpu1
    match.players[2] = cpu2
    match.players[3] = cpu3
    match.change_output(output) 
    @match_controller = match.controller
  end
end