class School < ActiveRecord::Base
  belongs_to :school_district
  has_many :app_users
end