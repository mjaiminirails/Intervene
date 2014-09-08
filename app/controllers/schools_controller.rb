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
              :phone,
              :zip_code
              :fax,
              :school_district_id,
              :grade_configuration_id,
              :school_type_id,
              :grade_type_id
        )
  end

end