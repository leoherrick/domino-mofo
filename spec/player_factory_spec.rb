require "spec_helper"

module DominoMofo
  describe PlayerFactory do
    
    before(:each) do
      match_with_2 = Match.new(2,3) 
      match_with_3 = Match.new(3,3) 
      match_with_4 = Match.new
      player_factory_for_2 = PlayerFactory.new(2, match_with_2)
      player_factory_for_3 = PlayerFactory.new(3, match_with_3)
      player_factory_for_4 = PlayerFactory.new(4, match_with_4)
      @player_group_with_two = player_factory_for_2.create_players
      @player_group_with_three = player_factory_for_3.create_players
      @player_group_with_four = player_factory_for_4.create_players
      @all_three_player_groups = [@player_group_with_two, @player_group_with_two, @player_group_with_four]
    end

    it "should create a player group object" do
      @all_three_player_groups.each do |object| 
        object.class.should equal(PlayerGroup)
      end
    end
    
    it "should create a player group with one and only one human per group" do
      @all_three_player_groups.each do |player_group|
        list_of_humans_in_group = player_group.find_all {|player| player.class == HumanPlayer}
        list_of_humans_in_group.should have_exactly(1).human_player
      end
    end
    
    it "should create player group with all computer players except one" do 
      @player_group_with_two.find_all {|player| player.class == ComputerPlayer}.should have_exactly(1).computer_players
      @player_group_with_three.find_all {|player| player.class == ComputerPlayer}.should have_exactly(2).computer_players
      @player_group_with_four.find_all {|player| player.class == ComputerPlayer}.should have_exactly(3).computer_players
    end
    
    it "should add game object to each player" do
      @player_group_with_four.each do |player|
        player.game.should be_true
      end
    end
    
  end

  
end