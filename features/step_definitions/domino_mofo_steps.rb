require 'lib/domino_mofo.rb'

Given /^I have just started Domino Mofo$/ do
  game_controller = DominoMofo::GameController.new(Output.new)
end

When /^I am welcomed by the game$/ do
  game_controller = DominoMofo::GameController.new(Output.new)
  game_controller.say_welcome
end


When /^I am asked how many players I want to play$/ do
  game_controller = DominoMofo::GameController.new(Output.new)
  game_controller.ask_for_opponents
end

When /^I choose (\d+) players$/ do |arg1|
  game_controller = DominoMofo::GameController.new(Output.new)
  game_controller.try_setting_opponents(2)
end

When /^I am asked how many houses I want to play to$/ do
    game = DominoMofo::Game.new(output)
    game.ask_for_houses
    output.messages.should include("And how many houses are you up for? Three, Four, or Five?")
end

When /^I choose (\d+) houses$/ do |arg1|
end

When /^when the game starts$/ do
end

Then /^I should see "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should have (\d+) dominos in my hand$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^and the boneyard should have (\d+) dominos$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^a scorecard should have been drawn with (\d+) empty columns$/ do |arg1|
  pending # express the regexp above with the code you wish you had
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