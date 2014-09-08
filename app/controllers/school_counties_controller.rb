class SchoolCountiesController < ApplicationController


  private

  def county_params
    params.require(:school_county).
      permit(
      :name,
      :contact_person,
      :contact_email,
      :website,
      :title,
      :street1,
      :street2,
      :city,
      :state,
      :zip_code,
      :phone,
      :fax
      )
  end

end