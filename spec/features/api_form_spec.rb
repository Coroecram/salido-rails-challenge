require 'spec_helper'

RSpec.feature 'Api requests' do

  before(:each) { visit wines_api_form_path }

  it 'has the right content' do
    expect(page).to have_content('Find Wines')
  end

  it 'handles finding nothing' do
    fill_in 'Search by wine name:', :with => "zzzyyyxxxtttzzz34", visible: false
    click_button 'Submit'

    expect(page).to have_content('That query did not return any wines')
  end

  it 'handles search errors' do
    fill_in 'From:', :with => 9999, visible: false
    fill_in 'To:', :with => 0, visible: false
    click_button 'Submit'

    expect(page).to have_content('Max price must be greater than min price')
  end

  it "retrieves specified amount" do
    fill_in 'Amount to return:', :with => 7, visible: false
    click_button 'Submit'

    expect(page).to have_selector('li', count: 7)
  end

  it 'searches correctly' do
    fill_in 'Search by wine name:', :with => "Cabernet", visible: false
    click_button 'Submit'

    expect(page).to have_content('Cabernet', count: 5)
  end

  it 'redirects on success' do
    click_button 'Submit'

    expect(page).to have_content('Retrieved Wines')
  end

end
