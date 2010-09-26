require "spec_helper"

module DominoMofo


  describe GameController do 
    
    let(:output) { double('output').as_null_object }
    let(:game_controller) { GameController.new(output) }
    
    it "should offer a welcome message" do
      output.should_receive(:puts).with("Yo Yo Yo! Hope you're ready to throw some bones playa! LET'S DO DIS!")
      game_controller.say_welcome
    end
    
    
    context "game_details" do
      it "should store opening game details in a hash for later" do
        game_controller.try_setting_opponents(2)
        game_controller.try_setting_houses(5)
        game_controller.opening_game_details.class == Hash
      end
    
      it "should get players" do 
        game_controller.try_setting_opponents(2)
        game_controller.get_players.should == 3
      end
    
      it "should get houses" do
        game_controller.try_setting_houses(5)
        game_controller.get_houses.should == 5
      end
    end
    
    context "#when collecting data on startup" do
      context "#opponents" do
        it "should asks the user to choose between 1 and 3 opponents" do
          output.should_receive(:puts).with("How many playas you wanna to play dawg? One, two, or tre?")
          game_controller.ask_for_opponents
        end

        it "should validate the user's response" do
          ["1","2","3"].each do |number_of_opponents|
            game_controller.is_valid_number_of_opponents(number_of_opponents).should be_true 
          end
        
          ["0","A","7", ""].each do |number_of_opponents| 
            game_controller.is_valid_number_of_opponents(number_of_opponents).should be_false
          end     
        end

        it "should ask the user to try again if invalid" do
          output.should_receive(:puts).with("Speak English?!! Uno, Dos, or Tres people dude?")
          game_controller.ask_for_opponents_again
        end

        it "shoudl give success message to user if valid" do 
          output.should_receive(:puts).with("A'ight. Dem's some baaad men you brought with ya.")
          game_controller.give_opponents_success_message
        end
      end
    
      context "#houses" do
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
    
    describe "start game" do
     it "should initialize game with players and houses" do
       game_controller.try_setting_opponents(2)
       game_controller.try_setting_houses(5)
       game_controller.start_game
       game_controller.game.class.should == Game       
       
     end
      
      
    end
    
  end
end