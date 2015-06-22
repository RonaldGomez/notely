class Note < ActiveRecord::Base
	belongs_to :category
	validates :title
	validates :body
	validates :category_id
end
