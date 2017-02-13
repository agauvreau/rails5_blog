require "rails_helper"

RSpec.feature "Showing an article" do
    #before running the scenario we need at least 1 article 
    before do
        @john = User.create(email: "john@example.com", password: "password")
        @fred = User.create(email: "fred@example.com", password: "password")
        @article = Article.create(title: "Title one", body: "Body of article one", user: @john)
    end
    
    scenario "To non-signed in user hide the Edit and Delete buttons" do
        visit "/"
        click_link @article.title
        
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(page).to have_content(@article.title)
        #checks if the path is what is should be 
        expect(current_path).to eq(article_path(@article))
        expect(page).not_to have_link("Edit Article")
        expect(page).not_to have_link("Delete Article")

    end
    
    scenario "To non-owner user hide the Edit and Delete buttons" do
        
        login_as(@fred)
        visit "/"
        click_link @article.title
        
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(page).to have_content(@article.title)
        #checks if the path is what is should be 
        expect(current_path).to eq(article_path(@article))
        expect(page).not_to have_link("Edit Article")
        expect(page).not_to have_link("Delete Article")

    end
    
    
end