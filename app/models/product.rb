class Product < ActiveRecord::Base
  #belongs_to :supplier
  has_and_belongs_to_many :suppliers
end
