module DominoMofo
  
  class Game
    @players
    @boneyard
    @board
    @queue
    @match
    @board_controller
    attr_reader :players, :boneyard, :board, :queue, :match, :board_controller
    attr_writer :whose_turn, :board, :boneyard
    
    def initialize(match = Match.new)
      @match = match
      @players = @match.players
      @boneyard = Boneyard.new
      @board = Board.new
      @queue = Queue.new
      @players.each {|p| @queue << p }
      @board_controller = BoardController.new(@board)
      deal_dominoes
    end
    
    def deal_dominoes
      @players.each{|player| player.hand.replace @boneyard.draw_seven}
    end
    
  end
end