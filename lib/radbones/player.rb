module Radbones
  
  class Player
    
    attr_reader :hand, :number
    attr_writer :hand
    
    def initialize number
      @hand = []
      @number = number
    end
  end
end