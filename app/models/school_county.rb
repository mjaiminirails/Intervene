class SchoolCounty < ActiveRecord::Base
  belongs_to :school_system
  has_many :districts
end
