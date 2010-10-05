require "spec_helper"

module DominoMofo

  describe DominoGroup do
    
    before(:each) do
      @standard_set_of_dominoes = DominoGroup.new
      @standard_set_of_dominoes.push(
       Domino.new(0,0), Domino.new(0,1), Domino.new(0,2), Domino.new(0,3), Domino.new(0,4), Domino.new(0,5), Domino.new(0,6),
       Domino.new(1,1), Domino.new(1,2), Domino.new(1,3), Domino.new(1,4), Domino.new(1,5), Domino.new(1,6),
       Domino.new(2,2), Domino.new(2,3), Domino.new(2,4), Domino.new(2,5), Domino.new(2,6),
       Domino.new(3,3), Domino.new(3,4), Domino.new(3,5), Domino.new(3,6), 
       Domino.new(4,4), Domino.new(4,5), Domino.new(4,6),
       Domino.new(5,5), Domino.new(5,6),
       Domino.new(6,6)
      )
    end
        
    it "can retrieve all dominos of a suit" do
      all_sixes = @standard_set_of_dominoes.get_all_dominoes_of_suit(6)
      all_sixes.should have(7).dominos
    end
    
    it "can retrieve all doubles" do
      all_doubles = @standard_set_of_dominoes.get_all_doubles
      all_doubles.should have(7).dominos
    end
    
    it "can retrieve a given domino" do
      boxcars = @standard_set_of_dominoes.get_domino(6,6)
      boxcars.should be_true
    end
    
    
    it "knows if has a given domino" do
      @standard_set_of_dominoes.has_domino?(6,6).should be_true
      @standard_set_of_dominoes.has_domino?(1,0).should be_true
      @standard_set_of_dominoes.has_domino?(6,7).should be_false
    end
    
    it "should remove a given domino" do
      expect {
        @standard_set_of_dominoes.remove_domino!(6,6)
      }.to change {
        @standard_set_of_dominoes.has_domino?(6,6)
      }.from(true).to(false)
    end
    
    
  end
end