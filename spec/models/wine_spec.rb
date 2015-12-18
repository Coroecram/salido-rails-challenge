require 'spec_helper'

describe 'Wine' do
  before(:all) do
    @wine = FactoryGirl.create(:wine)
  end

    it "has a valid factory" do
      expect(@wine).to be_valid
      @wine.save
    end


   it "is invalid without a unique name" do
    wine_name = @wine.dup
    wine_name.url = "www.newurl.com"
    wine_name.min_price += 1
    wine_name.max_price += 1
    wine_name.retail_price += 1
    wine_name.kind = "Champagne"

    expect(wine_name).to_not be_valid
   end

   it "is invalid without a unique url" do
     wine_url = @wine.dup
     wine_url.name = "NewName"
     wine_url.min_price += 1
     wine_url.max_price += 1
     wine_url.retail_price += 1
     wine_url.kind = "Champagne"

     expect(wine_url).to_not be_valid
   end

   it "is invalid without a name" do
     @wine.name = ""
     expect(@wine).to_not be_valid
   end

   it "is invalid without min price" do
     @wine.min_price = nil
     expect(@wine).to_not be_valid
   end

   it "is invalid without min price" do
     @wine.min_price = ""
     expect(@wine).to_not be_valid
   end

   it "is invalid without a number as min price" do
     @wine.min_price = "string"
     expect(@wine).to_not be_valid
   end

   it "is invalid without max price" do
     @wine.max_price = ""
     expect(@wine).to_not be_valid
   end

   it "is invalid without a number as max price" do
     @wine.max_price = "string"
     expect(@wine).to_not be_valid
   end

   it "is invalid without retail price" do
     @wine.retail_price = nil
     expect(@wine).to_not be_valid
   end

   it "is invalid without a number as retail price" do
     @wine.min_price = "string"

     expect(@wine).to_not be_valid
   end

   it "is invalid if min price is greater than max price" do
     @wine.min_price, @wine.max_price = @wine.max_price, @wine.min_price

     expect(@wine).to_not be_valid
   end
end
