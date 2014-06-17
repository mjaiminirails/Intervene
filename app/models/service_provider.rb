class ServiceProvider < ActiveRecord::Base
	# has_and_belongs_to_many :intervention_types
  has_and_belongs_to_many :categories
	validates :name, :presence => true

  mount_uploader :image, ImageUploader
end