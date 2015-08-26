require 'enumerable'
require 'spec_helper'

describe Enumerable do

  describe "#my_each" do
    it "should go through the array and perform the block" do
      array = [1,2,3,4]
      output = []
      array.my_each { |x| output << x + 1 }
      output.should == [2,3,4,5]
    end
  end

  describe "#my_each_with_index" do
    it "go through array and perform the block with index" do
      array = [1,2,3,4]
      output = []
      array.my_each_with_index { |num, index| output << [num, index] }
      output.should == [[1, 0], [2, 1], [3, 2], [4, 3]]
    end
  end

  describe "#my_select" do
    it "select items based on block" do
      array = [1,2,3,4]
      output = []
      array.my_select { |x| output << x if x > 1 }
      output.should == [2,3,4]
    end
  end

  describe "#my_all?" do
    it "should return false if it contains nil" do
      array = [1,2,3,nil,4,5]
      array.my_all? {|x| x > 2 }.should == false
    end
    it "should return true if it contains truesy" do
      array = [1,2,3,4,5]
      array.my_all? { |x| x > 0 }.should == [1,2,3,4,5]
    end
  end

  describe "#my_any?" do
    it "should check array to see if it contains requested object" do
      array = [1,2,3]
      array.my_any? {|x| x == 2 }.should == true
    end
    it "empty array returns false" do
      array = []
      array.my_any?.should == false
    end
      it "return false when nil/false in array" do
      array = [nil, false]
      array.my_any?.should == false
    end
  end

  describe "#my_none?" do
    it "should return true when block doesnt find anything in array" do
      array = [1,2,3]
      array.my_none? {|x| x > 4}.should == true
    end
    it "should return false if it contains" do
      array = [1,2,3]
      array.my_none? {|x| x < 4}.should == false
    end
    it "should return true when nil/false only values" do
      array = [nil, false]
      array.my_none?.should == true
    end
  end

  describe "#my_count" do
    it "return number of things in array (even nil/false counts)" do
      array = [1,2,3,4,nil,false]
      array.my_count.should == 6
    end
    it "returns 0 for empty array" do
      array = []
      array.my_count.should == 0
    end
    it "returns # that satisfies block" do
      array = [1,2,3,4]
      array.my_count {|x| x % 2 == 0}.should == 2
    end
  end

  describe "#my_map" do
    it "completes block and updates array" do
      array = [1,2,3,4]
      array.my_map {|x| x * 2 }.should == [2,4,6,8]
    end
    it "completes proc and updates array" do
      array = [1,2,3,4]
      new_proc = Proc.new {|x| x * 2}
      array.my_map(&new_proc).should == [2,4,6,8]
    end
  end

    describe "#my_inject" do
      it "sends items to block and completes block" do
        array = [1,2,3,4,5]
        array.my_inject {|x, y| x + y}.should == 15
      end
  end
end
