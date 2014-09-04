class School < ActiveRecord::Base
  belongs_to :school_district
  has_many :app_users

  mount_uploader :image_upload, ImageUploader
end