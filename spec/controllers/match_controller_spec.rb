require "spec_helper"
include SpecHelper

module DominoMofo

  describe MatchController do            
    before(:each) do 
      match = Match.new
      @match_controller = MatchController.new(match, output)
    end
    
    describe "#start match" do
      it "should create a match object" do
        @match_controller.start_match
        @match_controller.match.should be_kind_of(Match)
      end
      
      it "should welcome the human player" do
        @match_controller.start_match
        output.messages.should include("Hope you ready to throw some bones playa! Let's do this!")
      end
      
      it "should not have a dom" do
        @match_controller.dom.should == nil
      end
    end
  end
end