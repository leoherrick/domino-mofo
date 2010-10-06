require "spec_helper"

module DominoMofo
  describe End do
    before(:each) do
      @end_with_six = End.new(6)
      @another_end_with_six = End.new(6)
      @end_with_five = End.new(5)
    end
        
    it "knows if of suit" do
      @end_with_six.should be_suit(6)
      @end_with_six.should_not be_suit(4)
    end

    it "should connect to another open-ended end of same suit" do    
      @both_ends_with_sixes = [@end_with_six, @another_end_with_six]

      @end_with_six.connect_to(@another_end_with_six)
      @both_ends_with_sixes.each {|e| e.should be_connected}
      @end_with_six.connected_to.should equal(@another_end_with_six)
    end

    it "should not connect to another end of different suit" do
      @end_with_six.connect_to(@end_with_five)
      @end_with_six.should_not be_connected
    end

    it "should not connect to another end that is already connected" do
      third_end_with_six = End.new(6)
      @end_with_six.connect_to(@another_end_with_six)
      third_end_with_six.connect_to(@end_with_six)
      third_end_with_six.should_not be_connected
    end
    
    it "knows if it's connected" do
      @end_with_six.connect_to(@another_end_with_six)
      @end_with_six.should be_connected
    end

    it "knows if it's open" do
      @end_with_six.should be_open
    end
    
    it "returns end it's connected to" do
      @end_with_six.connect_to(@another_end_with_six)
      @end_with_six.connected_to.should equal(@another_end_with_six)
    end

  end
end
