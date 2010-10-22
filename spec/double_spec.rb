require "spec_helper"

module DominoMofo
  
  describe Double do
  
    let(:six_six) { Double.new(6,6) }
    let(:five_five) { Double.new(5,5) }


    it "should return all pips if 0 or 1 side is connected" do
      six_six.scoring_pips.should equal(12)
      six_five = Domino.new(6,5)
      six_six.connect_to_domino_by_suit(six_five, 6)
      six_six.scoring_pips.should equal(12)
    end
  
  end
  

end