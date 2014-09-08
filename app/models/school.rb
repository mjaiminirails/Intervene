class School < ActiveRecord::Base
  belongs_to :school_district
  has_many :app_users
  has_many :grade_configurations
  has_many :grade_types
  has_many :referrals
  has_many :students

  has_one :school_type

  mount_uploader :image_upload, ImageUploader
end