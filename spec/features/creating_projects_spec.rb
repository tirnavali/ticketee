require "rails_helper"

RSpec.feature "Users can create new projects", :type => :feature do 
	
	#her senrayodan önce çalışır
	before do
		visit "/"

		click_link "New Project"
	end

	scenario "with valid attributes" do
		fill_in "Name", with: "Sublime Text 3"
		fill_in "Description", with: "A Text editor for everyone"
		click_button "Create Project"

		expect(page).to have_content "Project has been created."
		
		title = "Sublime Text 3 - Projects - Ticketee"
		expect(page).to have_title title
	end

	scenario "when providing invalid attributes" do
		click_button "Create Project"

		expect(page).to have_content "Project has not been created."
		expect(page).to have_content "Name can't be blank"
	
	end
end

