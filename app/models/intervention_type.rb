class InterventionType < ActiveRecord::Base
  has_and_belongs_to_many :subcategories
	validates :name, presence: :true, uniqueness: :true
end