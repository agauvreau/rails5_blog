# when I  request something that doesn't exist (ie an article) through the address bar (articles/5, yet there is no article id 5)
# this should test the exception catching.
require 'rails_helper'

#typing in the address bar (ie: articles/5) is a GET request
RSpec.describe "Articles", type: :request do
    
    #creates the article
    before do
       @john = User.create(email: "john@example.com", password: "password")
       @fred = User.create(email: "fred@example.com", password: "password")
       @article = Article.create!(title: "Title one", body: "Body of article one", user: @john)
       
    end
    
    describe 'GET /articles/:id/edit' do
       context 'with non-signed in user' do
           before {get "/articles/#{@article.id}/edit"}
            it "redirects to the sign in page" do
            expect(response.status).to eq 302
            flash_message = "You need to sign in or sign up before continuing."
            expect(flash[:alert]).to eq flash_message
            end
           
       end
       
       context 'with signed in user who is non-owner' do
           before do
               login_as(@fred)
               get "/articles/#{@article.id}/edit"
           end
           it "redirects to the home page" do
               expect(response.status).to eq 302
               flash_message = "You can only edit your own article."
               expect(flash[:alert]).to eq flash_message
           end
       end
       
       context 'with signed in user as owner ' do
            before do
                login_as(@john)
                get "/articles/#{@article.id}/edit"
            end
            it "succesfully edits article" do
                expect(response.status).to eq 200
            end
       end
       
       context 'with signed in user as owner ' do
            before do
                login_as(@john)
                get "/articles/#{@article.id}/edit"
            end
            it "succesfully edits article" do
                expect(response.status).to eq 200
            end
       end
       
    end
    
    describe 'DELETE /articles/:id' do
       context 'with non-signed in user' do
           before do
            delete "/articles/#{@article.id}"
           end
           it "redirects to the sign in page" do
           expect(response.status).to eq 302
           flash_message = "You need to sign in or sign up before continuing."
           expect(flash[:alert]).to eq flash_message
           end
           
       end
       
       context 'with signed in user who is non-owner' do
           before do
               login_as(@john)
               delete "/articles/#{@article.id}"
           end
           it "redirects to the home page" do
               expect(response.status).to eq 302
               flash_message = "You can only delete your own article."
               expect(flash[:alert]).to eq flash_message
           end
       end
       
       context 'with signed in user as owner ' do
            before do
                login_as(@john)
                delete "/articles/#{@article.id}"
            end
            it "succesfully delete article" do
                expect(response.status).to eq 200
            end
       end
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

