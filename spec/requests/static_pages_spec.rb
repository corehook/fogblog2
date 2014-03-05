require 'spec_helper'

describe "StaticPages" do
let(:base_title) { "Ruby  on Rails" } 
	describe "Home page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
  end
  it "should have the right title" do
  	visit '/static_pages/home'
  	expect(page).to have_title("#{base_title} | Home")
  end
end

describe "Help  page" do 
	it "should have content 'Help'" do
		visit '/static_pages/help'
		expect(page).to have_content('Help')
	end
	it "should have the right title" do
  	visit '/static_pages/help'
  	expect(page).to have_title("#{base_title} | Help")
  end
end

describe "About page" do
	it "should have content 'About'" do
		visit '/static_pages/about'
		expect(page).to have_content('About')
	end
	it "should have the right title" do
  	visit '/static_pages/about'
  	expect(page).to have_title("#{base_title} | About")
  end
end
describe "Contacts page" do
  it "should have content 'Contacts'" do
    visit '/static_pages/contacts'
    expect(page).to have_content('Contacts')
  end
  it "should have the right title" do
    visit '/static_pages/contacts' 
    expect(page).to have_title("#{base_title} | Contacts")
end
end
end
