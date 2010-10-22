require "spec_helper"

module DominoMofo
  describe End do
    before(:each) do
      @end_with_six = End.new(6, Domino.new(6,6))
      @another_end_with_six = End.new(6, Domino.new(6,5))
    end

    it "belongs to a domino" do
      @end_with_six.domino.should be_true
    end
    
    it "returns suit" do
      @end_with_six.suit.should equal(6)      
    end
    
    it "tests for suit" do
      @end_with_six.should be_suit(6)
      @end_with_six.should_not be_suit(4)
    end

    describe "#connection" do

      it "should connect to another end" do    
        @both_ends_with_sixes = [@end_with_six, @another_end_with_six]

        @end_with_six.connect_to(@another_end_with_six)
        @both_ends_with_sixes.each {|e| e.should be_connected}
        @end_with_six.connected_to.should equal(@another_end_with_six)
      end

      it "returns end it's connected to" do
        @end_with_six.connect_to(@another_end_with_six)
        @end_with_six.connected_to.should equal(@another_end_with_six)
      end
      
      it "tests for connectedness" do
        @end_with_six.connect_to(@another_end_with_six)
        @end_with_six.should be_connected
      end

      it "tests for openness" do
        @end_with_six.should be_open
      end
    end

    

  end
end
