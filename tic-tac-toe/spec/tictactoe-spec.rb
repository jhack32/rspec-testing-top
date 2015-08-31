require "tictactoe"
require "spec_helper"
require 'StringIO'

describe TicTacToeGame do
  describe "#play" do
    it "play? method should works" do
      @game = TicTacToeGame.new
    end
    it "should exit game if input is (no)" do
      @game.stub!(:gets) { "no\n"}
      @game.should_receive(:puts).with == "Okay, maybe next time!"
    end
  end
end
