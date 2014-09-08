class SchoolDistrictsController < ApplicationController

=begin
#We don't need this. But I decided to add it. We might have an instance when we want the school district to sign up?
def index
    @school_districts = SchoolDistrict.all
  end

 def new
    @school_district = SchoolDistrict.new
  end

  def create
    @school_district = SchoolDistrict.new(district_params)
    if @school_district.save
      redirect_to root_url
    end
  end
=end

private

  def district_params
    params.require(:school_district).
      permit( :name,
              :street1,
              :street2,
              :city,
              :state,
              :zip_code,
              :contact_person,
              :contact_email,
              :phone,
              :fax,
              :school_system_id
        )
  end

end