class DominoMofo::Boneyard < DominoMofo::DominoGroup
  include DominoMofo
  
  def initialize
    self.push(
     Double.new(0), Domino.new(0,1), Domino.new(0,2), Domino.new(0,3), Domino.new(0,4), Domino.new(0,5), Domino.new(0,6),
     Double.new(1), Domino.new(1,2), Domino.new(1,3), Domino.new(1,4), Domino.new(1,5), Domino.new(1,6),
     Double.new(2), Domino.new(2,3), Domino.new(2,4), Domino.new(2,5), Domino.new(2,6),
     Double.new(3), Domino.new(3,4), Domino.new(3,5), Domino.new(3,6), 
     Double.new(4), Domino.new(4,5), Domino.new(4,6),
     Double.new(5), Domino.new(5,6),
     Double.new(6)
    )
    wash!
  end

  def draw_one
    pop
  end

  def draw_seven
    result = DominoGroup.new
    7.times { result << pop }
    result
  end        
  
  private 
  
  def wash!
    size.downto(1) { |n| push delete_at(rand(n)) }
  end
end
