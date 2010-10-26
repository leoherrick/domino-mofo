require "spec_helper"

module DominoMofo
  
  describe AiBase do     
    before(:each) do
      #set up doubles and stubs
      cpu1 = double('cpu')
      cpu2 = double('cpu')
      match = double('match')
      active_game = double('active_game')
      board = one_one_pinwheel
      @two_oh = Domino.new(2,0)
      oh_six = Domino.new(0,6)
      oh_oh = Domino.new(0,0)
      hand1 = Hand.new << @two_oh << oh_oh << oh_six    
      hand2 = Hand.new << oh_oh << oh_six    
      cpu1.stub(:match).and_return(match)
      cpu2.stub(:match).and_return(match)
      cpu1.stub(:hand).and_return(hand1)
      cpu2.stub(:hand).and_return(hand2)
      match.stub(:active_game).and_return(active_game)
      active_game.stub(:board).and_return(board)
      
      @ai_with_two_oh = AiBase.new(cpu1)
      @ai_without_two_oh = AiBase.new(cpu2)
    end
    
    it "should know which dominoes in hand can be played on the board" do
      @ai_with_two_oh.playable_dominoes.should include(@two_oh)
    end
    
    it "should know if it has a play" do
      @ai_with_two_oh.should have_play
      @ai_without_two_oh.should_not have_play
    end
    
    it "should pick the first playable domino to play" do
      @ai_with_two_oh.domino_to_play.should equal(@two_oh)
    end
    
    it "should know what dominio on the board it play on" do
      @ai_with_two_oh.domino_to_play_on.should have_both_ends(2,1)
    end
    
    it "should know the suit it will connect them with" do
      @ai_with_two_oh.suit_to_connect_with.should equal(2)
    end
  end
end
  