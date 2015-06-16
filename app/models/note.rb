class Note < ActiveRecord::Base
	belongs_to :category
	validate :title
	validate :body
	validate :category_id
end
