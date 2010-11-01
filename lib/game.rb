module DominoMofo
  
  class Game
    attr_accessor :board, :boneyard
    attr_reader :players, :match, :controller
    
    def initialize(match)
      @match = match
      @players = @match.players
      @boneyard = Boneyard.new
      @board = Board.new
      @controller = GameController.new(self)
      @controller.deal_dominoes
    end
    
    def first_game?
      @match.dom ? false : true
    end    
  end
end