require "spec_helper"

module DominoMofo
  
  describe AiBase do     
    before(:each) do
      cpu = double('cpu')
      match = double('match')
      active_game = double('active_game')
      board = one_one_pinwheel
      @two_oh = Domino.new(2,0)
      oh_six = Domino.new(0,6)
      oh_oh = Domino.new(0,0)
      hand = Hand.new << @two_oh << oh_oh << oh_six
      
      cpu.stub(:match).and_return(match)
      cpu.stub(:hand).and_return(hand)
      
      match.stub(:active_game).and_return(active_game)
      
      active_game.stub(:board).and_return(board)
      
      @ai = AiBase.new(cpu)
    end
    
    it "should know which dominoes in hand can be played on the board" do
      @ai.playable_dominoes.should include(@two_oh)
    end
    
    it "should know if it has a play" do
      @ai.should have_play
    end
    
    it "should pick the first playable domino to play" do
      @ai.domino_to_play.should equal(@two_oh)
    end
    
    it "should know what dominio on the board it play on" do
      @ai.domino_to_play_on.should have_both_ends(2,1)
    end
  end
end
  