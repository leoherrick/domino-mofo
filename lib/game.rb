module DominoMofo
  
  class Game   
    @players
    @boneyard
    @line
    attr_reader :players, :boneyard, :line, :whose_turn, :houses
    attr_writer :whose_turn
    
    def initialize options
      number_of_players = options[:players]
      player_factory = PlayerFactory.new
      @players = player_factory.create_player_group(number_of_players)
      @boneyard = Boneyard.new
      @line = Line.new
      
      deal_dominoes
      join_players_in_game
    end
    
    def deal_dominoes
      @players.each{|player| player.hand.replace @boneyard.draw_seven}
    end
    
    def join_players_in_game
      @players.each{|p| p.join_game(self)}
    end
  end
end