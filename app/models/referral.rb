class Referral < ActiveRecord::Base
  has_many :students
  has_and_belongs_to_many :service_providers

end