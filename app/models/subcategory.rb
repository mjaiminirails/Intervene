class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :service_providers
  has_and_belongs_to_many :intervention_types
  validates :name, :presence => true

end