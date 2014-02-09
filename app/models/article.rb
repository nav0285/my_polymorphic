class Article < ActiveRecord::Base
	has_many :comments, :as => :commentable, dependent: :destroy
	belongs_to :user
  attr_accessible :content, :title
end
