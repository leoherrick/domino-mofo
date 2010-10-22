module DominoMofo

  class MatchPlayerFactory
   attr_reader :match
    
    def initialize match
      @match = match
      create_players
    end
    
    private     
    def create_players
      number_of_humans = 1
      number_of_cpu_players = @match.number_of_players - number_of_humans
      player_group = PlayerGroup.new
      
      number_of_humans.times { player_group << HumanPlayer.new(@match) }
      number_of_cpu_players.times { player_group << ComputerPlayer.new(@match) }
      @match.players = player_group
    end
    
  end
  
end