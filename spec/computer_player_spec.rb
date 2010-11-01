require "spec_helper"

module DominoMofo
  describe ComputerPlayer do

    match = Match.new
    subject = ComputerPlayer.new(match)
      
    it "should be of the 'Player' class" do
      subject.kind_of?(Player).should be_true
    end

    it "should have AI" do
      subject.ai.should be_true
    end 
    
    describe "#automatic play" do
      before(:each) {setup_env}
      
      context "if it has a playable domino" do
        before(:each) { @hand << Domino.new(4,3) }

        describe "#play domino" do
          it "should increase number of dominoes on the board by one" do
            expect {
              @cpu3.make_best_play
            }.to change {
              @board.length
            }.by(1)
          end

          it "should reduce the number of dominoes in a player's hand by one" do
            expect {
              @cpu3.make_best_play
            }.to change {
              @hand.length
            }.by(-1)
          end

          it "should send them to the back of the queue" do
            expect {
              @cpu3.make_best_play
            }.to change {
              @queue.index(@cpu3)
            }.from(0).to(3)
          end          
        end
      end
      
      context "if it has no playable dominoes" do
        
        describe "#draw from the boneyard" do
          
          context "if the boneyard returns a playable domino" do
            before(:each) do
              @boneyard << Domino.new(4,3)
            end
            
            it "should increase number of dominoes on the board by one" do
              expect {
                @cpu3.make_best_play
              }.to change {
                @board.length
              }.by(1)
            end

            it "should not change the number of dominoes in a player's hand" do
              expect {
                @cpu3.make_best_play
              }.to change {
                @hand.length
              }.by(0)
            end

            it "should send them to the back of the queue" do
              expect {
                @cpu3.make_best_play
              }.to change {
                @queue.index(@cpu3)
              }.from(0).to(3)
            end          
          end

          context "if the boneyard returns three garbage bones before a valid one" do
            before(:each) do
              #note: when drawing, the boneyard implementation "pops", or draws from the back of the array in order
              @boneyard << Domino.new(4,3) << Domino.new(1,2) << Domino.new(1,2) << Domino.new(1,2) 
            end
                        
            describe "#draw until play is made" do
              
              it "should increase the number of dominoes on the board by one" do
                expect {
                  @cpu3.make_best_play
                }.to change {
                  @board.length
                }.by(1)
              end
              
              it "should increase the number of dominoes in the player's hand by three" do
                expect {
                  @cpu3.make_best_play
                }.to change {
                  @hand.length
                }.by(3)
              end
              
              it "should go to the back of the queue" do
                expect {
                  @cpu3.make_best_play
                }.to change {
                  @queue.index(@cpu3)
                }.from(0).to(3)
              end              
            end
          end
          context "if the boneyard has no bones" do
            describe "should knock" do
               it "should not increase the number of dominoes on the board" do
                expect {
                  @cpu3.make_best_play
                }.to change {
                  @board.length
                }.by(0)
              end

              it "should not increase the number of dominoes in the player's hand" do
                expect {
                  @cpu3.make_best_play
                }.to change {
                  @hand.length
                }.by(0)
              end

              it "should go to the back of the queue" do
                expect {
                  @cpu3.make_best_play
                }.to change {
                  @queue.index(@cpu3)
                }.from(0).to(3)
              end
            end
          end
        end
      end
    end   
    def setup_env
      match = Match.new
      cpu3 = match.players[2]
      queue = match.current_game.controller.queue
      queue.shift_to_player!(cpu3)
      board = match.current_game.board
      hand = cpu3.hand
      hand.clear
      hand << Domino.new(0,0)
      board << Domino.new(5,4)
      boneyard = match.current_game.boneyard
      @hand = hand
      @board = board
      @cpu3 = cpu3
      @queue = queue
      @boneyard = boneyard
    end
  end
end