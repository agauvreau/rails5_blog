class Article < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
    #orders the articles in reverse order of creation
    default_scope { order(created_at: :desc)}
    belongs_to :user
    has_many :comments, dependent: :destroy
    #dependent: :destroy will make sure the comment is deleted when the linked article is.
end
