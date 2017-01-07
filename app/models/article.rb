class Article < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
    #orders the articles in reverse order of creation
    default_scope { order(created_at: :desc)}
end
