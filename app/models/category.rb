class Category < ActiveRecord::Base
  has_and_belongs_to_many :intervention_types
  has_and_belongs_to_many :categories
  has_many :subcategories
  validates :name, :presence => true

end