require 'spec_helper'

RSpec.feature 'New Product form' do
  before(:each) { visit new_wine_path }

    it 'has appropriate content' do
      expect(page).to have_content 'Add a new Product'
    end

    it 'has a link back to all products' do
      click_link "All Products"

      expect(page).to have_content 'All Wines'
    end

    it 'has a wine name input' do
      expect(page).to have_content("Wine name:")
    end

    it 'has a wine url input' do
      expect(page).to have_content("Wine URL:")
    end

    it 'has a wine name input' do
      expect(page).to have_content("Wine Max Price:")
    end

    it 'has a min price input' do
      expect(page).to have_content("Wine Min Price:")
    end

    it 'has a max price input' do
      expect(page).to have_content("Wine Retail Price:")
    end

    it 'has a retail price input' do
      expect(page).to have_content("Wine Retail Price:")

    end

    it 'has a type input' do
      expect(page).to have_content("Wine Type:")
    end

    it "creates a new wine on valid input" do
      fill_in 'Wine name:', :with => "TestName", visible: false
      fill_in 'Wine URL:', :with => "www.testurl.com", visible: false
      fill_in 'Wine Max Price:', :with => "34.00", visible: false
      fill_in 'Wine Min Price:', :with => "32.00", visible: false
      fill_in 'Wine Retail Price:', :with => "40.00", visible: false
      select "Wine"

      click_button 'Submit'
      expect(page).to have_content('All Wines')
      expect(page).to have_content('TestName')
    end

    it "handles validation errors for presence" do
      click_button 'Submit'
      expect(page).to have_content("can't be blank", count: 6)
    end

    it "handles validation errors for max/min" do
      fill_in 'Wine name:', :with => "TestName", visible: false
      fill_in 'Wine URL:', :with => "www.testurl.com", visible: false
      fill_in 'Wine Max Price:', :with => "32.00", visible: false
      fill_in 'Wine Min Price:', :with => "34.00", visible: false
      fill_in 'Wine Retail Price:', :with => "40.00", visible: false
      select "Wine"

      click_button 'Submit'
      expect(page).to have_content('Max price must be greater than or equal to')
    end
end
