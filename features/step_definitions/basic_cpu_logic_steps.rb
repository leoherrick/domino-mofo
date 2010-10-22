Given /^I'm playing in a match$/ do
  @output = Output.new
  @match_controller = DominoMofo::MatchController.new(@output)
  @match_controller.start_match
  @match = @match_controller.match
  @match.should be_true
end

Given /^the board has a single domino \(the 6-6\)$/ do 
  @board = @match.active_game.board
  six_six = DominoMofo::Double.new(6,6)
  @board.place_lead(six_six)
  @board.should have_domino_with_both_ends?(6,6)
  @board.should have_exactly(1).domino
end

Given /^its the cpu's turn to play$/ do
  @queue = @match.active_game.queue
  @computer_player = @queue[2]
  @queue.shift_to_player!(@computer_player)
  @queue.first.should be_a_computer_player
end

Given /^the cpu has a 6-3, a 6-2, and a 5-5 in its hand$/ do
  hand = @computer_player.hand
  hand.clear
  hand << DominoMofo::Domino.new(6,3) << DominoMofo::Domino.new(6,2) << DominoMofo::Double.new(5,5)
  hand.should have(3).dominoes
end

When /^the cpu plays$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the domino played should have been the (\d+)\-(\d+)$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then /^the (\d+) of the (\d+)\-(\d+) should become an open\-end on the board$/ do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

Then /^the (\d+) of the (\d+)\-(\d+) should remain an open\-end on the board$/ do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

Then /^the cpu should score (\d+) points$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^the cpu's turn should be over$/ do
  pending # express the regexp above with the code you wish you had
end
