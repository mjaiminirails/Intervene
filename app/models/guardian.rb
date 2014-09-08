class Guardian < ActiveRecord::Base
  has_one :guardian_role
  has_and_belongs_to_many :students

end