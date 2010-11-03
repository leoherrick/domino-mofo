require "spec_helper"

module DominoMofo

  describe DominoGroup do
    before(:each) { @standard_set_of_dominoes = create_standard_set_of_dominoes }

    describe "#has_domino_with_suits" do
      it "should return true if group has dominoes with the given suits" do
        @standard_set_of_dominoes.should have_domino_with_suits(6,6)
        @standard_set_of_dominoes.should have_domino_with_suits(1,0)
      end
      it "should return false if given two suits not found together in group" do
        @standard_set_of_dominoes.should_not have_domino_with_suits(6,7)
      end
    end
    
    describe "#find_all_dominoes_of_suit" do
      it "should return another DominoGroup with just those dominos matching the given the suit" do
        all_sixes = @standard_set_of_dominoes.find_all_dominoes_of_suit(6)
        all_sixes.should have(7).dominos
        all_sixes.should be_kind_of(DominoGroup)
      end
    end

    describe "#find_all_doubles" do
      it "should return another DominoGroup with just the Doubles" do
        all_doubles = @standard_set_of_dominoes.find_all_doubles
        all_doubles.should have(7).dominos
        all_doubles.should be_kind_of(DominoGroup)
      end
    end
    
    describe "#find_domino_with_suits" do
      it "should return a single Domino from the group matching the given suits" do
        boxcars = @standard_set_of_dominoes.find_domino_with_suits(6,6)
        boxcars.should have_both_suits(6,6)
        boxcars.should be_kind_of(Domino)
      end      
    end
    
    describe "#remove_domino_with_suits!" do
      it "should remove domino with given ends from the group and return that group" do
        expect {
          @standard_set_of_dominoes.remove_domino_with_suits!(6,6)
        }.to change {
          @standard_set_of_dominoes.has_domino_with_suits?(6,6)
        }.from(true).to(false)
      end
    end        
  end
  def create_standard_set_of_dominoes
    standard_set_of_dominoes = DominoGroup.new
    standard_set_of_dominoes.push(
     Double.new(0), Domino.new(0,1), Domino.new(0,2), Domino.new(0,3), Domino.new(0,4), Domino.new(0,5), Domino.new(0,6),
     Double.new(1), Domino.new(1,2), Domino.new(1,3), Domino.new(1,4), Domino.new(1,5), Domino.new(1,6),
     Double.new(2), Domino.new(2,3), Domino.new(2,4), Domino.new(2,5), Domino.new(2,6),
     Double.new(3), Domino.new(3,4), Domino.new(3,5), Domino.new(3,6), 
     Double.new(4), Domino.new(4,5), Domino.new(4,6),
     Double.new(5), Domino.new(5,6),
     Double.new(6)
    )   
    standard_set_of_dominoes
  end
end