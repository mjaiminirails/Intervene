class SchoolSystemsController < ApplicationController

=begin
def index
    @school_systems = SchoolSystem.all
  end

 def new
    @school_system = SchoolSystem.new
  end

  def create
    @school_system = SchoolSystem.new(system_params)
    if @school_system.save
      redirect_to root_url
    end
  end
=end

private

  def system_params
    params.require(:school_system).
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