class Product < ActiveRecord::Base
	validates :name, presence: true, length: { in: (3..100)}, uniqueness: true
	validates :description, presence: true, length: { in: (10..1000)}
end
