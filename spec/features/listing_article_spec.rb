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

end