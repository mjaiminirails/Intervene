class ServiceProvider < ActiveRecord::Base
  has_and_belongs_to_many :subcategories
  has_and_belongs_to_many :referrals
	validates :name, :presence => true

  mount_uploader :image, ImageUploader

  def uniq_categories
  	cats = self.subcategories.map do |sub|
  		sub.category
  	end
  	cats.uniq
  end
end

