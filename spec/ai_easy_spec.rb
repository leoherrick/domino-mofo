require "spec_helper"

module DominoMofo

  describe AIEasy do    
    before(:each) { @ai = AIEasy.new }
    
    it "should play the best domino" do
      board = double('board')
      hand = double('hand')
      @ai.play_best_domino(board, hand).should be_true
    end
        
  end
    
end