require "tictactoe"
require "spec_helper"
require 'StringIO'

describe TicTacToeGame do
  describe "#play" do
    it "Asks whether or not you want to play" do
      @game = TicTacToeGame.new
    end
    it "should continue if yes" do
      expect(@game.play?).to == @game.start_game
    end
    it "should display goodbye message if (no)" do
      expect(@game.play?).to == "Okay, maybe next time!"
    end
  end
end
