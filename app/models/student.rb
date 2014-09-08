class Student < ActiveRecord::Base
  belongs_to :school
  belongs_to :referral
  has_and_belongs_to_many :guardians
end