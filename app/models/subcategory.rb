class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :service_providers
  validates :name, :presence => true

end