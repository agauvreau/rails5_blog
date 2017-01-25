require "rails_helper"

RSpec.feature "Creating Articles" do
    before do
        @john = User.create!(email: "john@example.com", password: "password")
        login_as(@john)
    end
    
    
    scenario "A user creates a new article" do
        #visit root
        visit "/"
        #method to click on something
        click_link "New Article"
        #this method fill the element selected with something
        fill_in "Title", with: "Creating a blog"
        fill_in "Body", with: "Lorem ipsum"
        #this will click the selected button
        click_button "Create Article"
        
        expect(Article.last.user).to eq(@john)
        expect(page).to have_content("Article has been created")
        expect(page.current_path).to eq(articles_path)
        expect(page).to have_content("Created by: #{@john.email}")
        end
    #this scenario check article validations    
    scenario "A user fails to create a new article" do
        #visit root
        visit "/"
        #method to click on something
        click_link "New Article"
        #this method fill the element selected with something
        fill_in "Title", with: ""
        fill_in "Body", with: ""
        click_button "Create Article"
        expect(page).to have_content("Article has not been created")
        expect(page).to have_content("Title can't be blank")
        expect(page).to have_content("Body can't be blank")
    end
    
end
    
    
