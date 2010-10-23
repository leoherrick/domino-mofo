require "spec_helper"

module DominoMofo
  describe HumanPlayer do

    match = Match.new
    subject = HumanPlayer.new(match)
    
    it { subject.should be_kind_of(Player) }  
  end
end