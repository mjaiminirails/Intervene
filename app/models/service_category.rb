class ServiceCategory < ActiveRecord::Base
	has_and_belongs_to_many :service_providers
	validates :name, presence: :true, uniqueness: :true
end