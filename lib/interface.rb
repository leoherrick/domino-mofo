class DominoMofo::Interface
  include DominoMofo
  include Ruport::Data
  
  attr_reader :input
  
  def initialize
    @input = STDIN
    @command_list = ["hand", "exit", "board", "knock", "play", "lead", "score", "count", "draw"]
  end
  
  
  def get_command
    temp_command = @input.gets
    temp_command.chomp!
    split = temp_command.split(' ')
    command = split.shift
    args = split
    if @command_list.index(command) != nil then
      @command = command
      @args = args
    end
  end

  def run(match)
    while @command != "exit"
      get_command
      if @command == "hand"
        dominoes = match.current_player.hand
        dominoes.each_with_index do |d, i|
          puts "(#{i}) [#{d.suit_of_end1}|#{d.suit_of_end2}]"
        end

      elsif @command == "board"
        dominoes = match.current_game.board
        dominoes.each_with_index do |d, i|
          ends = String.new
          if d.open? then ends = " open ends:#{d.find_all_open_ends.collect{|x| x.suit}}" end
          puts "(#{i}) [#{d.suit_of_end1}|#{d.suit_of_end2}]#{ends}"
        end

      elsif @command == "knock"
        match.current_player.knock

      elsif @command == "play"
        hand_domino = match.current_player.hand[ @args[0].to_i ]
        board_domino = match.current_game.board[@args[2].to_i ]
      begin
        Screen.clear
        match.current_player.play_domino_on_board( hand_domino, board_domino)
      rescue
        puts "not a valid play!"
      end

      elsif @command == "lead"
        Screen.clear
        domino = match.current_player.hand[ @args[0].to_i ]  
        match.current_player.lead_out(domino)

      elsif @command == "score"
        scores = match.scorecard.scores
        puts "\nScores:"
        ruport = Table.new :column_names => %w[player scores]
        scores.each do |k,v|
          ruport <<  [k, v]
        end
        print ruport
        puts "highest score: #{match.players.highest_score}"
        puts "player with highest score: #{match.players.player_with_highest_score.name}"
              
      elsif @command == "count"
        puts "\nDominoes Remaining:"
        ruport = Table.new :column_names => %w[player dominoes]
        match.players.each do |p|
          ruport << [p.name, p.hand.length]
        end
        print ruport
               
      elsif @command == "draw"
        match.current_player.draw_from_boneyard

      else
        puts @command
      end
    end
  end
end
