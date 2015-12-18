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

end
