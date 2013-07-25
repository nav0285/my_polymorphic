class Event < ActiveRecord::Base
	has_many :comments, :as => :commentable, dependent: :destroy
  attr_accessible :content, :name
end
