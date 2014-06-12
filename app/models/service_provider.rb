class ServiceProvider < ActiveRecord::Base
	has_and_belongs_to_many :service_categories
	validates :name, :presence => true

  mount_uploader :image, ImageUploader
end