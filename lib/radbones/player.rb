module Radbones
  
  class Player
    
    attr_reader :hand
    attr_writer :hand
    
    def initialize
      @hand = []
    end
  end
end