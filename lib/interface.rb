class DominoMofo::Interface
  include DominoMofo
  include Ruport::Data
  
  attr_reader :input
  
  def initialize
    @input = STDIN
    @command_list = ["hand", "exit", "board", "knock", "play", "lead", "score", "count", "draw", "line"]
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
        board_domino = match.current_game.board[ @args[2].to_i ]
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
      
      elsif @command == "line"
        offset_left = 0
        offset_top = 0
        spokes = []
        spinner = match.current_game.board.spinner
        spinner.neighbors.each do |n|
          line = Hash.new
          line[n.distance_from_spinner] = n
          build_line(n, line)
          spokes << line
        end
        puts "spokes: #{spokes.length}"
        
        if spokes[0]
          s = spokes[0]
          keys = s.keys.reverse
          keys.each do |k|
            endward = s[k].endward_end
            spinward = s[k].spinward_end
            print "[#{endward.suit}|#{spinward.suit}]"
          end
        end
        print "[#{spinner.suit_of_end1}|#{spinner.suit_of_end2}]"
        if spokes[1]
          s = spokes[1]
          keys = s.keys
          keys.each do |k|
            endward = s[k].endward_end
            spinward = s[k].spinward_end
            print "[#{spinward.suit}|#{endward.suit}]"
          end
        end
        
        # spokes.each_with_index do |s, i|
        #   print "line #{i}: "
        #   keys = s.keys
        #   keys.each do |k|
        #     endward = s[k].endward_end
        #     spinward = s[k].spinward_end
        #     print "[#{spinward.suit}|#{endward.suit}]"
        #   end
        #   print "\n"
        # end
        
      elsif @command == "draw"
        match.current_player.draw_from_boneyard

      else
        puts @command
      end
    end
  end
  
  def build_line(domino, line)
    dist_from_spin = domino.distance_from_spinner
    line[dist_from_spin] = domino
    next_domino = domino.neighbors.find{ |n| n.distance_from_spinner == dist_from_spin + 1 }
    if next_domino 
      build_line(next_domino, line) 
    end 
  end
  
  
end