require "spec_helper"

module DominoMofo
  
  describe Player do 
    before(:each) do
      @match = Match.new
      @cpu3 = @match.players[2]
      @match.current_game.controller.queue.shift_to_player!(@cpu3)
      @board = @match.current_game.board
    end

    it "should have a hand (of dominoes)" do
      @cpu3.hand.should be_true
    end      
    
    it "should belong to a match" do
      @cpu3.match.should be_true
    end
    
    describe "#boolean" do
    
      it "should know if it's in instance of the Human class" do
        human_player = HumanPlayer.new(@match) #subclass of Player
        human_player.should be_human_player
      end

      it "should know if it's in instance of the Computer class" do
        computer_player = ComputerPlayer.new(@match) #subclass of Player
        computer_player.should be_computer_player
      end
    end
    
    describe "#game play" do
      
      describe "#leading out" do
        before(:each) do
          @five_five = Double.new(5)
          @hand = @cpu3.hand.clear
          @hand << @five_five
        end
        
        it "should increase number of dominoes on the board by one" do
          expect {
            @cpu3.lead_out(@five_five)
          }.to change {
            @board.length
          }.by(1)
        end
        
        it "should reduce the number of dominoes in a player's hand by one" do
          expect {
            @cpu3.lead_out(@five_five)
          }.to change {
            @hand.length
          }.by(-1)
        end
        
        it "should send them to the back of the queue" do
          expect {
            @cpu3.knock
          }.to change {
            @match.current_game.controller.queue.index(@cpu3)
          }.from(0).to(3)
        end
      end
      
      describe "#playing dominoes" do
        before(:each) do
          @five_five = Double.new(5)
          @hand = @cpu3.hand.clear
          @hand << @five_five
          @board << Domino.new(5,4)
        end
        
        it "should increase number of dominoes on the board by one" do
          expect {
            @cpu3.play_domino_on_board_by_suit(@five_five, @board.find_domino_with_suits(5,4), 5)
          }.to change {
            @board.length
          }.by(1)
        end
        
        it "should reduce the number of dominoes in a player's hand by one" do
          expect {
            @cpu3.play_domino_on_board_by_suit(@five_five, @match.current_game.board.find_domino_with_suits(5,4), 5)
          }.to change {
            @hand.length
          }.by(-1)
        end
        
        it "should send them to the back of the queue" do
          expect {
            @cpu3.knock
          }.to change {
            @match.current_game.controller.queue.index(@cpu3)
          }.from(0).to(3)
        end
      end
      
      describe "#drawing from the boneyard" do
        before(:each) do
          @boneyard = @match.current_game.boneyard
          @boneyard << double("domino")          
        end
        
        it "should reduce the number of dominoes in the boneyard by one" do
          expect {
            @cpu3.draw_from_boneyard
          }.to change {
            @boneyard.length
          }.by(-1)
        end
        
        it "should increase the number of dominoes in a player's hand by one" do
          expect {
            @cpu3.draw_from_boneyard
          }.to change {
            @cpu3.hand.length
          }.by(1)
        end
        
        it "should not chnage their position in the queue" do
          expect {
            @cpu3.draw_from_boneyard
          }.to change {
            @match.current_game.controller.queue.index(@cpu3)
          }.by(0)
        end

      end
      
      describe "#knocking" do
        
        it "should send them to the back of the queue" do
          expect {
            @cpu3.knock
          }.to change {
            @match.current_game.controller.queue.index(@cpu3)
          }.from(0).to(3)
        end
      end
    end
  end
end
