include DominoMofo

  Given /^a match has been setup where I \(the human player\) has the highest double$/ do
    start_match_where_human_has_highest_double_to_leadout
  end

  Then /^I should be welcomed to the game$/ do
    @output.messages.should include("Hope you ready to throw some bones playa! Let's do this!")
  end

  Then /^I should be asked to begin play with the (\d+)$/ do |arg|
    @output.messages.should include("You have the highest double. Please lead out with the double #{arg}.")
  end

  Given /^the match has just begun$/ do
    pending # express the regexp above with the code you wish you had
  end

  Given /^cpu(\d+) has the highest double$/ do |arg1|
    pending # express the regexp above with the code you wish you had
  end

  Then /^the announcer should tell me cpu(\d+) has the highest double$/ do |arg1|
    pending # express the regexp above with the code you wish you had
  end

  Then /^cpu(\d+) should automatically lead out with the highest double$/ do |arg1|
    pending # express the regexp above with the code you wish you had
  end

  Then /^each of the other cpu players should automatically play$/ do
    pending # express the regexp above with the code you wish you had
  end

  Then /^the announcer should tell me it's my turn$/ do
    pending # express the regexp above with the code you wish you had
  end
