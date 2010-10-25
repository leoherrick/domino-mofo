module DominoMofo
  
  class Game
    @number_of_players
    @players
    @boneyard
    @board
    @queue
    @match
    attr_reader :players, :boneyard, :board, :whose_turn, :houses, :number_of_players, :queue, :match
    attr_writer :whose_turn, :board
    
    def initialize(match = Match.new)
      @match = match
      @players = @match.players
      @boneyard = Boneyard.new
      @board = Board.new
      @queue = Queue.new
      @players.each {|p| @queue << p }
      
      deal_dominoes
    end
    
    def deal_dominoes
      @players.each{|player| player.hand.replace @boneyard.draw_seven}
    end
    
  end
end