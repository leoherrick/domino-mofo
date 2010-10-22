module DominoMofo

  class PlayerFactory
    @number_of_players
    @match
    
    def initialize (number_of_players, match)
      @number_of_players = number_of_players
      @match = match
    end
        
    def create_players
      number_of_humans = 1
      number_of_cpu_players = @number_of_players - number_of_humans
      player_group = PlayerGroup.new
      
      number_of_humans.times { player_group << HumanPlayer.new(@match) }
      number_of_cpu_players.times { player_group << ComputerPlayer.new(@match) }
      return player_group
    end
    
  end
  
end