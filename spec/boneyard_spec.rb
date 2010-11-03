require "spec_helper"

module DominoMofo
  
  describe Boneyard do
    
   before(:each) {@boneyard = Boneyard.new}
    
    it "should have 28 dominoes" do
      @boneyard.should have(28).dominos
    end
           
    it "should have seven of each suit" do 
      suits = (0..6)
      suits.each do |suit|
        @boneyard.find_all_dominoes_of_suit(suit).should have(7).dominoes
      end  
    end

    it "should have seven doubles" do
      @boneyard.find_all_doubles.should have(7).doubles
    end
    
    it "should be randomly shuffled" do
      @boneyard1 = Boneyard.new
      @boneyard2 = Boneyard.new           
      found_domino_in_different_position = false #this will change to true below
      27.times do |i| 
        boneyard1_domino =  @boneyard1[i]
        boneayrd2_domino = @boneyard2.find_domino_with_suits(
          boneyard1_domino.suit_of_end1,
          boneyard1_domino.suit_of_end2)

        index_of_domino_in_first_boneyard = boneyard1_domino
        index_of_domino_in_second_boneyard = @boneyard1.index(boneayrd2_domino)
        if index_of_domino_in_second_boneyard != index_of_domino_in_first_boneyard
          found_domino_in_different_position = true
          break
        end
      end
      found_domino_in_different_position.should be_true  
    end
    
    describe "#draw_one" do
    
      it "should return one domino" do 
        @boneyard.draw_one.should be_kind_of(Domino)
      end
    
      it "should change the size of the boneyard by -1" do 
        expect{
          @boneyard.draw_one
        }.to change{
          @boneyard.length
        }.by(-1)
      end
    end
    
    describe "#draw_seven" do 
      it "should return a domino group of 7 dominoes" do 
        @boneyard.draw_seven.should be_kind_of(DominoGroup)
        @boneyard.draw_seven.should have(7).dominoes
      end

      it "should change the size of the boneyard by -7" do 
        expect{
          @boneyard.draw_seven
        }.to change{
          @boneyard.length
        }.by(-7)
      end
    end

  end
end
