require "spec_helper"

module DominoMofo

  describe DominoGroup do
    
    before(:each) do
      @standard_set_of_dominoes = DominoGroup.new
      @standard_set_of_dominoes.push(
       Double.new(0,0), Domino.new(0,1), Domino.new(0,2), Domino.new(0,3), Domino.new(0,4), Domino.new(0,5), Domino.new(0,6),
       Double.new(1,1), Domino.new(1,2), Domino.new(1,3), Domino.new(1,4), Domino.new(1,5), Domino.new(1,6),
       Double.new(2,2), Domino.new(2,3), Domino.new(2,4), Domino.new(2,5), Domino.new(2,6),
       Double.new(3,3), Domino.new(3,4), Domino.new(3,5), Domino.new(3,6), 
       Double.new(4,4), Domino.new(4,5), Domino.new(4,6),
       Double.new(5,5), Domino.new(5,6),
       Double.new(6,6)
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
    
    it "can retrieve a domino with given sides" do
      boxcars = @standard_set_of_dominoes.get_domino_with_ends(6,6)
      boxcars.should be_true
    end
    
    it "knows if has domino with given sides" do
      @standard_set_of_dominoes.should have_domino_with_both_ends(6,6)
      @standard_set_of_dominoes.should have_domino_with_both_ends(1,0)
      @standard_set_of_dominoes.should_not have_domino_with_both_ends(6,7)
    end
    
    it "should remove a domino with given sides" do
      expect {
        @standard_set_of_dominoes.remove_domino_with_ends!(6,6)
      }.to change {
        @standard_set_of_dominoes.has_domino_with_both_ends?(6,6)
      }.from(true).to(false)
    end
    
    
  end
end