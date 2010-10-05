require 'lib/domino_mofo.rb'

Given /^I initiate a new match$/ do
  @output = Output.new
  @match_controller = DominoMofo::MatchController.new(@output)
end

When /^I am welcomed$/ do
  @match_controller.welcome
  expected_msg = "Yo Yo Yo! Hope you're ready to throw some bones playa! LET'S DO DIS!"
  @output.messages.should include(expected_msg)
end

When /^I am prompted to select my number of opponents$/ do
  @match_controller.ask_for_opponents
  expected_msg = "How many playas you wanna to play dawg? One, two, or tre?"
  @output.messages.should include(expected_msg)
end

When /^I choose (\d+) opponents$/ do |number_of_opponents|
  @match_controller.set_players_from_opponents(number_of_opponents)
end

When /^I am prompted to select the number of houses$/ do
  @match_controller.ask_for_houses
  expected_msg = "And how many houses you down for? Three, Four, or Five?"
  @output.messages.should include(expected_msg)
end

When /^I choose (\d+) houses$/ do |number_of_houses|
  @match_controller.set_houses(number_of_houses)
end

When /^the match is started$/ do
  @match_controller.start_match
  @match = @match_controller.match
end

Then /^I should see "([^"]*)"$/ do |arg1|
  @match_controller.say_game_is_ready
  @output.messages.should include("A'ight Playa. Let's do this thing.")
end

Then /^an empty scorecard for 4 players should exist$/ do
   scorecard = @match.scorecard
   scorecard.players.should equal(4)
end

Given /^I have started a match with 4 players$/ do
  @output = Output.new
  @match_controller = DominoMofo::MatchController.new(@output)
  @match_controller.set_players_from_opponents(3)
  @match_controller.start_match
  @match = @match_controller.match
  @game = @match.active_game
end

Given /^I have boxcars$/ do
  players = @game.players
  players.should have(4).players #remove
  player_with_boxcars = players.find_player_with_domino(6,6)
  player_with_boxcars.hand.remove_domino!(6,6)
  players.human_player.hand << DominoMofo::Domino.new(6,6)
end


Then /^a new game should start$/ do
  @active_game = @match.active_game
  @active_game.should be_true
end

Then /^there should be 4 players$/ do
  @players = @active_game.players
  @players.should have(4).players
end

Then /^each player should have 7 dominoes in their hand$/ do
  @players.each {|player| player.hand.should have(7).domiones }
end

Then /^the boneyard should be empty$/ do
  boneyard = @active_game.boneyard
  boneyard.should be_empty
end

When /^I have the highest pair$/ do
  player_with_highest_pair = @match_controller.return_player_with_highest_pair
  player_with_highest_pair.is_human?.should be_true
end

Then /^I should be prompted to play$/ do
  @match_controller.tell_user_to_lead_with_highest_pair
  expected_msg = "Looks like you've got the highest double. Go ahead and lead-out dawg!"
  @output.messages.should include(expected_msg)
end

Given /^the computer has the highest pair$/ do
  players = @game.players
  players.should have(4).players #remove
  initial_player_with_boxcars = players.find_player_with_domino(6,6)
  initial_player_with_boxcars.hand.remove_domino!(6,6)
  @player_with_higest_pair = players[1]
  @player_with_higest_pair.hand << DominoMofo::Domino.new(6,6)
end

Then /^the computer should play that bone on the line$/ do
  @player_with_higest_pair.lead_with_domino(6,6)
  game = @match_controller.match.active_game
  game.line.dominoes.should have_exactly(1).domino
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