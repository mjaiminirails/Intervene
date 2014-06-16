class InterventionType < ActiveRecord::Base
	has_and_belongs_to_many :service_providers
  has_and_belongs_to_many :categories
	validates :name, presence: :true, uniqueness: :true
end