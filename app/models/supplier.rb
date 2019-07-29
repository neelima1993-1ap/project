class Supplier < ActiveRecord::Base
	#has_many :products , dependent: :destroy
	has_and_belongs_to_many :products

	def active
		products.where(active: true).count
	end
	def total
		products.count
	end
end
