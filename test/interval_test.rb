require "../app/interval.rb"

describe Interval do
	before(:all) do
		@interval = Interval.new
	end

	it "when pass nil should return []" do
		@interval.proccess(nil).should == []
	end

	it "when pass [] should return []" do
		@interval.proccess([]).should == []
	end

	it "when pass [100, 101, 102, 103, 104, 105, 110, 111, 113, 114, 115, 150] should return [[100,105], [110,111], [113,115], [150]]" do
		numbers = [100, 101, 102, 103, 104, 105, 110, 111, 113, 114, 115, 150];
		@interval.proccess(numbers).should == [[100,105], [110,111], [113,115], [150]]
	end
end