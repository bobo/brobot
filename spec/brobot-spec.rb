require 'spec_helper'
describe "hej" do
	it "should worl" do
		1.should == 1
	end


	require_relative '../lib/cinch/plugins/Wolfram'
	describe 'Wolfram' do

		it "mjao" do
			VCR.use_cassette('wolfram') do
				wolfram = Wolfram.new
				result = wolfram.search("1+1")
				result.should == "2"
			end
		end

		it "mjaos" do
			VCR.use_cassette('wolfram2') do
				wolfram = Wolfram.new
				result = wolfram.search("17 gmt")
				result.should_not be_nil
			end
		end
	end
end