require "spec_helper"

module DominoMofo
  
  describe Game do 
    
    let(:game) { Game.new }
        
      describe "#start game" do
        let(:game_with_2_til_5) { Game.new.set_players(2).create_boneyard.distribute_bones.create_scorecard }
        let(:game_with_3_til_2) { Game.new }
        let(:game_with_4_til_4) { Game.new }
        
        it "creates all players" do 
          game.set_players(2)
          players = game.players
          players.should have(2).players
          players.each{|x| x.class.should == Player}
        end
    
        it "creates the boneyard" do 
          game.create_boneyard
          game.boneyard.should have(28).dominos
        end
    
        it "distributes the bones" do 
          game.set_players(3)
          game.create_boneyard
          game.distribute_bones
          game.players.each{|player| player.hand.should have(7).dominos}
          game.boneyard.should have(7).dominos
        end
      
        it "creates the scorecard" do 
          game.set_players(3)
          game.create_scorecard
          game.scorecard.scores.has_key?("player 3").should be_true
        end
        
        it "does all four with a single command" 
      end
      
      
    it "identfies who goes first" do
      game.set_players(4)
      game.players[0].hand << Domino.new(4,5)
      game.players[1].hand << Domino.new(4,3)
      game.players[2].hand << Domino.new(5,5)
      game.players[3].hand << Domino.new(3,3)
      game.get_first_player.should === game.players[2]
      game.whose_turn.should === game.players[2]
      game.players[1].hand << Domino.new(6,6)
      game.get_first_player.should === game.players[1]      
      game.whose_turn.should === game.players[1]
    end       
     
    it "automatically plays opponents dominos prior to their turn"
    it "prompts the user to play when it is their turn"
 
    describe "#AI Play" do
      
      it "should know what suits are in play" do 
        dom1 = Domino.new(2,3)
        dom2 = Domino.new(2,4)
        game.play_first_domino(dom1)
        game.play(dom2, 2)
        game.line.unconnected_sides.should include(3) && include(4)
      end
      
      it "should know how many points are on the board" do 
        dom1 = Domino.new(2,3)
        dom2 = Domino.new(2,4)
        game.play_first_domino(dom1)
        game.play(dom2, 2)
        game.get_points_on_the_board.should == 7
      end
      
      it "should know how many to add/delete to the score to create a scoring play"
      it "should know if any of the domino in hand could create a scoring play"
      it "should randomly play any valid domino"
      it "should draw from the boneyard if no valid dominos are in hand"
      it "should repeat the process until there are no more dominos in the boneyard"
      it "should pass it's turn if the boneyard is empty and hand has no valid dominos"
      
    end
 
    describe "#Human Play" do
      
      it "should be able to play a bone when the line is empty" do 
        domino_being_played = Domino.new(2,4)
        game.play_first_domino(domino_being_played)
        game.line.dominos.first.should === domino_being_played
      end
                  
      it "should be able to play a bone when the line is already established" do
        dom1 = Domino.new(2,3)
        dom2 = Domino.new(2,4)
        game.play_first_domino(dom1)
        game.play(dom2, 2)
        dom2.return_a_side_matching(2)[:connected_to].should === dom1
        dom1.return_a_side_matching(2)[:connected_to].should === dom2
      end
    end

  end
end