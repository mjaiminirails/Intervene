class AppUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#  has_one :school
#  has_one :service_provider
has_and_belongs_to_many :roles
has_and_belongs_to_many :app_users
end
