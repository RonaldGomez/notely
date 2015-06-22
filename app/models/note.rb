class Note < ActiveRecord::Base
	belongs_to :category
	validates :title, presence: true
	validates :body, presence: true
	validates :category_id, presence: true
end
