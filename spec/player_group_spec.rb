require "spec_helper"

module DominoMofo
  
  describe PlayerGroup do
    
    describe "#find players" do
      
      context "when group has two players, player1 with the 2-3 and player2 with the 1-1" do
        before(:each) do
          match = Match.new
          @player1 = Player.new(match)
          @player2 = Player.new(match)
          @player1.hand << Domino.new(2,3) << Domino.new(4,3)
          @player2.hand << Double.new(2,2) << Double.new(1,1)
          subject << @player1 << @player2
        end
      
        it "should return player1 when asked to find player with either the 4-3 or 3-4" do
          subject.find_player_with_domino(2,3).should === @player1
          subject.find_player_with_domino(3,2).should === @player1
        end

        it "should return player2 when asked to find player with 1-1" do
          subject.find_player_with_domino(1,1).should === @player2
        end
      end
    end
  end
end
