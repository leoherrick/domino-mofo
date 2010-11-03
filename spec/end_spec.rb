require "spec_helper"

module DominoMofo
  describe End do
    before(:each) do
      @end_with_six = End.new(6, Domino.new(6,6))
      @another_end_with_six = End.new(6, Domino.new(6,5))
    end

    it "should belongs to a domino" do
      @end_with_six.domino.should be_true
    end
    
    it "should return suit" do
      @end_with_six.suit.should equal(6)
    end
    
    describe "#suit?" do
      it "should return true if suit matches given suit" do
        @end_with_six.suit?(6).should be_true      
      end
      it "should return false  if suit doesn't match given suit" do
        @end_with_six.suit?(5).should be_false
      end
    end
    
    describe "#connected?" do
      it "should return true if it's connected to another side" do
        @end_with_six.connect_to(@another_end_with_six)
        @end_with_six.should be_connected        
      end
      it "should return false if it's not connected" do
        @end_with_six.should_not be_connected        
      end
    end
    
    describe "#open?" do
      it "should return true if it's not connected" do
        @end_with_six.should be_open
      end      
      it "should return false if it's connected to another side" do
        @end_with_six.connect_to(@another_end_with_six)
        @end_with_six.should_not be_open        
      end
    end
  end
end
