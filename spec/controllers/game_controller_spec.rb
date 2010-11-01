require "spec_helper"

module DominoMofo
  
  describe GameController do       
    
    describe "#start game" do
      context "human player has 6-6" do
        before(:each) do
          match = double('match')
          game = double('game')

          human_player = double('human player')
          cpu1 = double('cpu1')
          cpu2 = double('cpu2')
          cpu3 = double('cpu3')
          
          human_player.stub(:hand).and_return(Hand.new << Double.new(6) << Domino.new(6,0))
          human_player.stub(:human_player?).and_return(true)
          cpu1.stub(:hand).and_return(Hand.new << Domino.new(6,1))
          cpu2.stub(:hand).and_return(Hand.new << Domino.new(6,2))
          cpu3.stub(:hand).and_return(Hand.new << Domino.new(6,3))
          player_group = PlayerGroup.new << human_player << cpu1 << cpu2 << cpu3

          game.stub(:players).and_return(player_group)
          game.stub_chain(:match, :controller, :announcer).and_return(Announcer.new(output))
          game.stub(:first_game?).and_return(true)
          @game_controller = GameController.new(game)
          @game_controller.start_game
        end
        
        it "should send message to player" do
          output.messages.should include("You have the highest double. Please lead out with your highest double.")
        end
      end
      
      context "cpu1 has 6-6" do
        before(:each) do
          match = double('match')
          game = double('game')

          human_player = double('human player')
          @cpu1 = double('cpu1')
          cpu2 = double('cpu2')
          cpu3 = double('cpu3')
          
          human_player.stub(:hand).and_return(Hand.new << Domino.new(6,0))
          @cpu1.stub(:hand).and_return(Hand.new << Double.new(6) << Domino.new(6,1))
          @cpu1.stub(:human_player?).and_return(false)
          @cpu1.stub(:lead_out)
          cpu2.stub(:hand).and_return(Hand.new << Domino.new(6,2))
          cpu3.stub(:hand).and_return(Hand.new << Domino.new(6,3))
          player_group = PlayerGroup.new << human_player << @cpu1 << cpu2 << cpu3

          game.stub(:players).and_return(player_group)
          game.stub_chain(:match, :controller, :announcer).and_return(Announcer.new(output))
          game.stub(:first_game?).and_return(true)
          @game_controller = GameController.new(game)
          @game_controller.start_game
        end
        
        it "should send message to player" do
          output.messages.should include("The computer has the highest double.")
        end

        it "should be moved to first in the queue" do
          @game_controller.player_at_turn.should equal(@cpu1)
        end
      end
    end
  end
end
  