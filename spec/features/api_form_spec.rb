RSpec.feature 'Api requests' do

  before(:each) { visit wines_api_form_path }

  it 'has the right content' do
    expect(page).to have_content('Find Wines')
  end

  


end
