class SchoolDistrict < ActiveRecord::Base
  belongs_to :school_county
  has_many :schools
end