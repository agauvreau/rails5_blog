# when I  request something that doesn't exist (ie an article) through the address bar (articles/5, yet there is no article id 5)
# this should test the exception catching.
require 'rails_helper'

#typing in the address bar (ie: articles/5) is a GET request
RSpec.describe "Articles", type: :request do
    
    #creates the article
    before do
       @article = Article.create(title: "Title one", body: "Body of article one")
    end
    
    describe 'GET /articles/:id' do
        context 'with existing article' do
            #checks if is will 'get' the article through its id
            before {get "/articles/#{@article.id}"}
            
            #response eq 200 = 200 means succesfull
            it "handles existing article" do
                expect(response.status).to eq 200
            end
        end    
    context 'with non-existing article' do
        # /xxxx doesn't exist
        before { get "/articles/xxxx"}
        
        it "handles non-existing article" do 
            expect(response.status).to eq 302
            flash_message = "The article you are looking for could not be found"
            expect(flash[:alert]).to eq flash_message
        end
        
        end
        
    end
end

