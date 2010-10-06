module DominoMofo
  
  class Game
    @number_of_players
    @players
    @boneyard
    @board
    @queue
    attr_reader :players, :boneyard, :board, :whose_turn, :houses, :number_of_players, :queue
    attr_writer :whose_turn
    
    def initialize(players = 4)
      @number_of_players = players
      player_factory = PlayerFactory.new(self)
      @players = player_factory.create_players
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