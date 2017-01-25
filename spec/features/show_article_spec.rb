require "rails_helper"

RSpec.feature "Showing an article" do
    #before running the scenario we need at least 1 article 
    before do
        john = User.create(email: "john@example.com", password: "password")
        login_as(john)
        @article = Article.create(title: "Title one", body: "Body of article one", user: john)
    end
    
    scenario "A user shows an article" do
        visit "/"
        click_link @article.title
        
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(page).to have_content(@article.title)
        #checks if the path is what is should be 
        expect(current_path).to eq(article_path(@article))
        
    end
    
    
end