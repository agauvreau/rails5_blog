require "rails_helper"

RSpec.feature "Creating Articles" do
    scenario "A user creates a new article" do
        #visiot root
        visit "/"
        #method to click on something
        click_link "New Article"
        #this method fill the element selected with something
        fill_in "Title", with: "Creating a blog"
        fill_in "Body", with: "Lorem ipsum"
        #this will click the selected button
        click_button "Create Article"
        
        expect(page).to have_content("Article has been created")
        expect(page.current_path).to eq(articles_path) 
        end
end
    
    
