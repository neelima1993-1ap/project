class Supplier < ActiveRecord::Base
	#has_many :products 
	has_and_belongs_to_many :products, dependent: :destroy

	def active
		products.where(active: true).count
	end
	def total
		products.count
	end
end
