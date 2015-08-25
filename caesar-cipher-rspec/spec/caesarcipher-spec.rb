require 'spec_helper'
require 'caesar-cipher'

describe "caesar_cipher" do
  it "shifts by a given number" do
    caesar_cipher("test", 5).should == "yjxy"
  end
  it "wraps from z to a" do
    caesar_cipher("zzz", 2).should == "bbb"
  end
  it "contains capital letter in sentence" do
    caesar_cipher("Hello, How are you?", 1).should == "Ifmmp, Ipx bsf zpv?"
  end
  it "keeps the same case" do
    caesar_cipher("aBcD", 2).should == "cDeF"
  end
end
