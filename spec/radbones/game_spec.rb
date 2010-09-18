require "spec_helper"

module Radbones
  
  describe Game do 
    
    let(:output) { double('output').as_null_object }
    let(:game) { Game.new(output) }
    
    describe "#welcome" do
      
      it "offers a welcome message" do    
        output.should_receive(:puts).with("Yo Yo Yo! Hope you're ready to throw some bones... playa!")
        game.welcome
      end
    end
    
    describe "#asks for and validates number of players" do

      it "asks the user to choose between 1 and 3 opponents" do
        output.should_receive(:puts).with("How many people do you wanna to play? You can play up to 3")
        game.ask_for_opponents
      end
      
      context "if invalid" do
        it "asks the user to try again" do
          output.should_receive(:puts).with("Speak English?!! Uno, Dos, or Tres people dude?")
          game.opponents = "4"
        end
      end
      
      context "if valid" do

        it "give success message to user" do 
          output.should_receive(:puts).with("A'ight. Dem's 2 baaad men you brought with ya.")
          game.opponents = "2"
        end
        
        it "creates the players" do 
          game.add_players(2)
          game.players.length.should == 2
          game.players.each{|x| x.class.should == Player}
        end
        
        it "creates the boneyard" do 
          game.create_boneyard
          game.boneyard.length.should == 28
        end
        
        it "distributes the bones" do 
          game.add_players(3)
          game.create_boneyard
          game.distribute_bones
          game.players.each{|player| player.hand.length.should == 7}
          game.boneyard.length.should == 7
        end
      end
    end
    
    describe "#asks for and validates number of houses" do
      
      it "asks the user to choose between 2 to 5 houses" do 
        output.should_receive(:puts).with("And how many houses are you up for? Three, Four, or Five?")
        game.ask_for_houses
      end
      
      context "if invalid" do
        it "tells the user to choose again" do 
          output.should_receive(:puts).with("Read man. Read! Three, Four, or Five?")
          game.houses = "8"
          
        end
      end
      
      context "if valid" do
        it "tells the user they're all set" do 
          output.should_receive(:puts).with("A'ight. First to 3 houses then. Better bring it.")
          game.houses = "3"
        end
        it "creates the scorecard"
        
      end
    end    
    
    describe "#sets up the game" do
      it "identfies who goes first"
      it "playes any moves up until the user's first move"
      it "prompts the user to play"
    end
  end
end