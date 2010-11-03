require "spec_helper"

module DominoMofo
  
  describe TurnQueue do
    before(:each) do
      @player1 = double('player1')
      @player2 = double('player2')
      @player3 = double('player3')
      @player4 = double('player4')
      @queue = TurnQueue.new << @player1 << @player2 << @player3 << @player4
    end
        
    it "should move second person to first after turns" do
      expect{
        @queue.shift_queue!        
      }.to change{
        @queue.index(@player2)
      }.from(1).to(0)
    end
    
    it "should move first person to last after turns" do
      expect{
        @queue.shift_queue!        
      }.to change{
        @queue.index(@player1)
      }.from(0).to(3)
    end
    
    it "should shift queue to a given player" do
      @queue.shift_to_player!(@player3)
      @queue.index(@player3).should equal(0)
      @queue.index(@player4).should equal(1)
      @queue.index(@player1).should equal(2)
      @queue.index(@player2).should equal(3)
    end
    
  end
  
end