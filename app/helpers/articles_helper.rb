module ArticlesHelper
    def persisted_comments(comments)
        #we just was comments from the database
        comments.reject{ |comment| comment.new_record?}
    end
end
