Polymorphic Association: When a model belongs to more than one model.

Eg: Article has comments
    Event has comments.
    So, comments model belongs to both Article and Event model.
    

class Article < ActiveRecord::Base
	has_many :comments, as: commentable
end	
	
class Event < ActiveRecord::Base
	has_many :comments, as: commentable
end

class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true
end	
