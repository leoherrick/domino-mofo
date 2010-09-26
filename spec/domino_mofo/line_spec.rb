require "spec_helper"

module DominoMofo
  describe Line do 
  
    let(:opening_bone) {Domino.new(1,2)}
    let(:opening_line) {Line.new(opening_bone)}

      it "should return an array of all its unconnected sides" do
        opening_line.get_unconnected_sides.should include(1) && include(2)
      end

      it "given a suit, should return the first domino with an unmached side of that suit" do
        opening_line.return_unmatched_of(2).should === opening_bone
      end

    describe "#playing" do
      
      it "should connect a domino to the line if you supply it with the domino object and suit you're using as the connector" do
        domino1 = Domino.new(2,3)
        opening_line.add_domino(domino1, 2)
        domino1.side1[:connected_to].should === opening_bone
        opening_bone.side2[:connected_to].should === domino1
      end

      it "should know which double was the spinner" do 
        first_double = Domino.new(1,1)
        second_double = Domino.new(2,2)
        line = opening_line
        [first_double, second_double].each{|x| line.add_domino(x, x.side1[:val])}
        line.spinner.should_not === second_double
        line.spinner.should === first_double
      end 
    end
      
      it "should know how many points are on the board"
      it "should know how many to add/delete to the score to create a scoring play"
    
  end
end