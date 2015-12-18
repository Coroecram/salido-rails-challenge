require 'spec_helper'

RSpec.feature 'Page Links' do
  after { Wine.delete_all }
  before do
     6.times { FactoryGirl.create(:wine) }
  end

  describe "index" do
    before(:each) { visit wines_path }
    it "has a make new link" do
      expect(page).to have_content 'Make New Product'
    end

    it "goes to new form when new link clicked" do
      click_link "Make New Product"

      expect(page).to have_content 'Add a new Product'
    end

    it "has Edit Product link" do
      expect(page).to have_content 'Edit Product'
    end

    it "goes to new form when new link clicked" do
      first('.edit-link').click

      expect(page).to have_content 'Update Product'
    end

    it "has an API to API link" do
      expect(page).to have_content 'Find New Products'
    end

    it "goes to api form with find link" do
      click_link "Find New Products"

      expect(page).to have_content 'Find Wines'
    end

    it "has 5 wines per page" do
      expect(page).to have_content 'Min Price:', count: 5
    end

    it "has 5 edit buttons" do
      expect(page).to have_content 'Edit Product', count: 5
    end

    it "has pagination" do
      expect(page).to have_css 'nav.pagination'
    end

    it "shows the wines in descending order" do
      expect(page).to have_content(Wine.last.name)
    end

  end
end
