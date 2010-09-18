require 'lib/RadBones.rb'

Given /^I'm not yet playing$/ do
end

When /^I am welcomed by the game$/ do
  game = Radbones::Game.new(output) 
  game.welcome
end

Then /^I should see "([^"]*)"$/ do |message|
  output.messages.should include(message) 
end

Given /^I've been asked "([^"]*)"$/ do |question|
  @game = Radbones::Game.new(output) 
  @game.welcome
  output.messages.should include(question)
end

When /^I enter "([^"]*)"$/ do |opponents| 
  @game.enter_opponents(opponents)
end
 
Then /^the response should be "([^"]*)"$/ do |response| 
  output.messages.should include(response) 
end 

Given /^the game has begun$/ do
  game = Radbones::Game.new(output) 
  game.welcome
  game.enter_opponents("2")
end

When /^I have the largest double\-suited domino$/ do
  pending # express the regexp above with the code you wish you had
end

When /^my opponent has the largest double\-suited domino$/ do
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