# require 'spec_helper'
# require 'byebug'
#
# RSpec.feature 'Edit Product form' do
#   before(:each) do
#             @wine = FactoryGirl.build(:wine)
#             @wine.save
#             visit "/wine/#{@wine.id}/edit"
#           end
#
#     it 'has appropriate content' do
#       expect(page).to have_content 'Update Product'
#     end
#
#     it 'has a link back to all products' do
#       click_link "All Products"
#
#       expect(page).to have_content 'All Wines'
#     end
#
#     it 'has a wine name input' do
#       expect(page).to have_content("Wine name:")
#     end
#
#     it 'has a wine url input' do
#       expect(page).to have_content("Wine URL:")
#     end
#
#     it 'has a wine name input' do
#       expect(page).to have_content("Wine Max Price:")
#     end
#
#     it 'has a min price input' do
#       expect(page).to have_content("Wine Min Price:")
#     end
#
#     it 'has a max price input' do
#       expect(page).to have_content("Wine Retail Price:")
#     end
#
#     it 'has a retail price input' do
#       expect(page).to have_content("Wine Retail Price:")
#
#     end
#
#     it 'has a type input' do
#       expect(page).to have_content("Wine Type:")
#     end
#
# end
