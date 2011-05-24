module DominoMofo
  
  class Match

    attr_reader :scorecard, :number_of_players, :number_of_houses, :controller, :announcer
    attr_accessor :current_game, :players, :dom
    
    def update ( play )
      # match stuff
    end
    
    def initialize(number_of_players = 4, number_of_houses = 3)
      @number_of_players = number_of_players
      @number_of_houses = number_of_houses
      @players = create_player_group
      @scorecard = Scorecard.new(@players)
      @current_game = Game.new(self)
      @dom = nil
      @announcer = Announcer.new(STDOUT)
    end
    
    def create_player_group
      players = PlayerGroup.new
      add_human_players(players)
      add_computer_players(players)
      return players
    end
    
    def start_match
      @announcer.welcome
      @current_game.start_game
    end

    def change_output output
      @announcer = Announcer.new(output)
    end
    
    def current_player
      @current_game.queue[0]
    end
        
    private     
    
    def add_human_players player_group
      human_player = HumanPlayer.new(self)
      player_group << human_player
    end
    
    def add_computer_players player_group
      number_of_cpu_players = number_of_players - 1
      number_of_cpu_players.times do
        cpu_player = ComputerPlayer.new(self)
        player_group << cpu_player
      end
    end
      
    def play(domino_to_play, domino_on_board, suit)
      d1 = current_game.player_at_turn.hand[domino_to_play.to_i]
      d2 = current_game.board[domino_on_board.to_i]
      current_game.board.play_domino_on_board_by_suit(d1, d2, suit.to_i)
    end
      
  end
end