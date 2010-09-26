require "spec_helper"

module DominoMofo


  describe GameController do 
    
    let(:output) { double('output').as_null_object }
    let(:game_controller) { GameController.new(output) }
    
    it "should offer a welcome message" do
      output.should_receive(:puts).with("Yo Yo Yo! Hope you're ready to throw some bones playa! LET'S DO DIS!")
      game_controller.say_welcome
    end

    describe "#opponents" do
      it "should asks the user to choose between 1 and 3 opponents" do
        output.should_receive(:puts).with("How many playas you wanna to play dawg? One, two, or tre?")
        game_controller.ask_for_opponents
      end

      it "can validate the user's response" do
        ["1","2","3"].each do |number_of_opponents|
          game_controller.is_valid_number_of_opponents(number_of_opponents).should be_true 
        end
        
        ["0","A","7", ""].each do |number_of_opponents| 
          game_controller.is_valid_number_of_opponents(number_of_opponents).should be_false
        end     
      end

      it "asks the user to try again if invalid" do
        output.should_receive(:puts).with("Speak English?!! Uno, Dos, or Tres people dude?")
        game_controller.ask_for_opponents_again
      end

      it "give success message to user if valid" do 
        output.should_receive(:puts).with("A'ight. Dem's some baaad men you brought with ya.")
        game_controller.give_opponents_success_message
      end
    end
    
    describe "#houses" do
      it "asks the user to choose between 2 to 5 houses" do 
        output.should_receive(:puts).with("And how many houses you down for? Three, Four, or Five?")
        game_controller.ask_for_houses
      end

      it "can validate the user's response" do
        ["3","4","5"].each do |number_of_houses|
          game_controller.is_valid_number_of_houses(number_of_houses).should be_true
        end
        
        ["0","A","7", ""].each  do |number_of_houses| 
          game_controller.is_valid_number_of_houses(number_of_houses).should be_false
        end
      end

      it "tells the user to choose again if invalid" do 
        output.should_receive(:puts).with("Read man. Read! Three, Four, or Five?")
        game_controller.ask_for_houses_again
      end
  
      it "give success message to user if valid" do 
        output.should_receive(:puts).with("A'ight. First to 3 houses then. Better bring it.")
        game_controller.give_houses_success_message
      end
    end
  end
end