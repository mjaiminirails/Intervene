class SchoolDistrictsController < ApplicationController
  belongs_to :school_system
  has_many :schools
end