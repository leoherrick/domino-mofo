require "spec_helper"

module DominoMofo

  describe MatchController do
        
    context "#begin game" do 
    
      before(:each) do 
        @output = double('output')        
        @match_controller = MatchController.new(@output)
      end
        
      it "should welcome the player" do
        expected_msg = "Yo Yo Yo! Hope you're ready to throw some bones playa! LET'S DO DIS!"
        @output.should_receive(:puts).with(expected_msg) 

        @match_controller.welcome
      end
    
      it "should ask for number of opponents" do
        expected_msg = "How many playas you wanna to play dawg? One, two, or tre?"
        @output.should_receive(:puts).with(expected_msg) 

        @match_controller.ask_for_opponents
      end

      it "should set players from opponents" do
        @match_controller.set_players_from_opponents(3)
        @match_controller.players.should equal(4)
      end
          
      it "should ask for number of houses" do
        expected_msg = "And how many houses you down for? Three, Four, or Five?"
        @output.should_receive(:puts).with(expected_msg)
        
        @match_controller.ask_for_houses
      end
      
      it "should set houses" do
        @match_controller.houses = 5
        @match_controller.houses.should equal(5)        
      end
      
      it "should create a match object" do
        @match_controller.start_match
        @match_controller.match.class.should equal(Match)
      end
      
      it "should issue a 'game started' success message" do
        expected_msg = "A'ight Playa. Let's do this thing."
        @output.should_receive(:puts).with(expected_msg)
        
        @match_controller.say_game_is_ready
      end

      describe "find player with highest bone"
      
        context "two player game" do
          before(:each) do
            game = Game.new(2)
            @player_1 = game.players[0]
            @cpu_1 = game.players[1]
            [@player_1, @cpu_1].each {|p| p.hand.clear}
            @match_controller.start_match
            @match_controller.match.active_game = game          
          end        

        context "p1 has the 3-3, cpu1 has the 1-1" do
          before(:each) do
            @player_1.hand << Domino.new(3,3) << Domino.new(1,2)
            @cpu_1.hand << Domino.new(1,1) << Domino.new(4,2)
            @player_with_highest_pair = @match_controller.return_player_with_highest_pair
          end
          it "should know the highest double is 'poison ivy'" do
            @player_with_highest_pair.hand.should have_domino_with_ends(3,3)
          end
          it "should know p1 is holding it" do
            @player_with_highest_pair.should === @player_1
          end
          it "should know p1 is a human" do
            @player_with_highest_pair.human_player?.should be_true
          end
        end

        context "p1 has the 3-3, cpu1 has the 5-5" do
          before(:each) do
            @player_1.hand << Domino.new(3,3) << Domino.new(1,2)
            @cpu_1.hand << Domino.new(3,2) << Domino.new(5,5)
            @player_with_highest_pair = @match_controller.return_player_with_highest_pair
          end
          it "should know the highest double is 5-5" do
            @player_with_highest_pair.hand.has_domino_with_ends?(5,5).should be_true
          end
          it "should know cpu1 is holding it" do
            @player_with_highest_pair.should === @cpu_1
          end
          it "should know cpu1 is a computer" do
            @player_with_highest_pair.computer_player?.should be_true
          end
        end
      end             
    end
            
  end
  
end