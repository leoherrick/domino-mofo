require "spec_helper"

module DominoMofo
  describe Announcer do
    before(:each) do
      @output = double("output")
      @announcer = Announcer.new(@output)
    end
    
    it "should welcome the player" do
      @output.should_receive(:puts).
        with("Hope you ready to throw some bones playa! Let's do this!") 
      @announcer.welcome
    end
    
    it "should ask for number of houses" do
      @output.should_receive(:puts).
        with("And how many houses you down for? Three, Four, or Five?") 
      @announcer.ask_for_houses
    end
    
    it "should ask for number of opponents" do
      @output.should_receive(:puts).
        with("How many playas you wanna to play dawg? One, two, or tre?") 
      @announcer.ask_for_opponents
    end
    
    it "should issue a 'game started' success message" do
      @output.should_receive(:puts).
        with("A'ight Playa. Let's do this thing.") 
      @announcer.say_game_is_ready
    end

    it "should ask player to play the double of a given number" do
      @output.should_receive(:puts).
        with("You have the highest double. Please lead out with your highest double.") 
      @announcer.please_play_double
    end

    it "should say that the cpu has moved" do
      @output.should_receive(:puts).
        with("The computer just made a play.") 
      @announcer.cpu_has_made_move
    end
    
    it "should say it's the human player's turn" do
      @output.should_receive(:puts).
        with("It's your turn, please make a play.") 
      @announcer.tell_player_it_is_their_turn
    end    
    
    it "should be able to return any message passed to it" do
      @output.should_receive(:puts).with("any old message")
      @announcer.return_message("any old message")
    end
  end
end