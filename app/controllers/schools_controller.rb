class SchoolsController < ApplicationController

  def index
    @schools = School.all 
  end
  
  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to root_url
    end
  end
  
  private 

  def school_params
    params.require(:school).
      permit( :district,
              :name,
              :mission,
              :image_url,
              :image_upload,
              :website,
              :street1,
              :street2,
              :city,
              :state,
              :work_phone,
              :fax,
              :school_district_id,
              :zip_code
        )
  end
  
end