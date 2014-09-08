class Referral < ActiveRecord::Base
  has_many :students

  belongs_to :school
  belongs_to :app_user

  has_and_belongs_to_many :service_providers

end