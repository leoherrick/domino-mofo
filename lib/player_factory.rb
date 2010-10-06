module DominoMofo

  class PlayerFactory
    @game
    
    def initialize game
      @game = game
    end
        
    def create_players
      number_of_players = @game.number_of_players
      number_of_humans = 1
      number_of_cpu_players = number_of_players - number_of_humans
      player_group = PlayerGroup.new
      
      number_of_humans.times { player_group << HumanPlayer.new(@game) }
      number_of_cpu_players.times { player_group << ComputerPlayer.new(@game) }
      return player_group
    end
    
  end
  
end