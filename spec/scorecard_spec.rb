require "spec_helper"

module DominoMofo

  describe Scorecard do 
<<<<<<< HEAD:spec/scorecard_spec.rb
=======
    
>>>>>>> d3463ed586bf1ff199d80c9eaa741b47f57eee4b:spec/scorecard_spec.rb
    before(:each) do
      match = Match.new
      @scorecard = Scorecard.new(match)
    end
<<<<<<< HEAD:spec/scorecard_spec.rb

    it "should belong to a match" do 
      @scorecard.match.should be_true
    end
    
    it "should display the score for each person" do 
      
    end
    
    it "should display the score in order" do
    end
    
=======
>>>>>>> d3463ed586bf1ff199d80c9eaa741b47f57eee4b:spec/scorecard_spec.rb
    
<<<<<<< HEAD:spec/scorecard_spec.rb
=======
    it "should belong to a match" do
      @scorecard.match.should be_true
    end    
>>>>>>> d3463ed586bf1ff199d80c9eaa741b47f57eee4b:spec/scorecard_spec.rb
  end
  
end
