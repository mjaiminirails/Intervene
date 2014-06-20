class ServiceProvider < ActiveRecord::Base
	# has_and_belongs_to_many :intervention_types
  has_and_belongs_to_many :subcategories
	validates :name, :presence => true

  mount_uploader :image, ImageUploader

  def uniq_categories
  	cats = self.subcategories.map do |sub|
  		sub.category
  	end
  	cats.uniq
  end
end