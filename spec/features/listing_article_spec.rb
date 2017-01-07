require "rails_helper"

RSpec.feature "Listing Articles" do
    #before running the scenario we need at least 2 articles
    before do
        @article1 = Article.create(title: "The first article", body: "Lorem ipsum 1")
        @article2 = Article.create(title: "The 2nd article", body: "Lorem ipsum 2")
    end
    
    scenario "A user lists all articles" do
        visit "/"
        expect(page).to have_content(@article1.title)
        expect(page).to have_content(@article1.body)
        expect(page).to have_content(@article2.title)
        expect(page).to have_content(@article2.body)
        expect(page).to have_link(@article1.title)
        expect(page).to have_link(@article2.title)
        
    end
    
    scenario "A user has no articles" do
        #delete all to simulate a User without any articles
        Article.delete_all
        
        visit "/"
        
        expect(page).not_to have_content(@article1.title)
        expect(page).not_to have_content(@article1.body)
        expect(page).not_to have_content(@article2.title)
        expect(page).not_to have_content(@article2.body)
        expect(page).not_to have_link(@article1.title)
        expect(page).not_to have_link(@article2.title)
        
        #checks for a no articles created message
        within ("h1#no-articles") do
           expect(page).to have_content("No Article Created")
        end
        
    end

end