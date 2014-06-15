class InterventionTypesController < ApplicationController

	def index
		@interventiontypes = InterventionType.order('name asc').all
	end

	def new
		@interventiontype = InterventionType.new
	end

	def create
		@interventiontype = InterventionType.new(interventiontype_params)
		if @interventiontype.save
			redirect_to intervention_type_path(@interventiontype)
		else
			render new_intervention_type_path
		end
	end

	def show
		@interventiontype = InterventionType.find(params[:id])
	end

	def edit
		@interventiontype = InterventionType.find(params[:id])
	end

	def update
		@interventiontype = InterventionType.find(params[:id])
		if @interventiontype.update(interventiontype_params)
			redirect_to intervention_type_path(@interventiontype), 
						notice: "Intervention Type updated successfully!!"
		else
			@err = @interventiontype.errors.full_messages
			redirect_to edit_intervention_type_path(@interventiontype), 
						:flash => { notice: "Invalid. Intervention Type NOT updated.", errors: @err }
		end
	end

	def destroy
		interventiontype = InterventionType.find(params[:id])
		interventiontype.destroy
		redirect_to intervention_types_path
	end

	def interventiontype_params
    params.require(:intervention_type).permit(:name, :description)
  end

end