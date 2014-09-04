class SchoolsController < ApplicationController

  has_one :district
  belongs_to :app_user

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

  def provider_params
    params.require(:service_provider).permit( :name,
                                              :mission,
                                              :image,
                                              :street1,
                                              :street2,
                                              :city,
                                              :state,
                                              :zip_code,
                                              :website,
                                              :contact_person,
                                              :contact_email,
                                              :work_phone,
                                              :fax,
                                              :other,
                                              :published
                                        )
  end
  
end