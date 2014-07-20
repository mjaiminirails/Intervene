ActiveAdmin.register ServiceProvider do

  menu priority: 2

  scope :published do |provs| provs.where("published = true") end
  scope :not_published do |provs| provs.where("published = false") end

  permit_params :name,
                :mission,
                :image,
                :remote_image_url,
                :website,
                :providers_email,
                :contact_person,
                :contact_email,
                :street1,
                :street2,
                :city,
                :state,
                :zip_code,
                :work_phone,
                :fax,
                :published,
                :other

  # This line is needed to workaround ActiveAdmin issue with 
  #   has_and_belongs_to_many relationship
  remove_filter :serviceproviders_subcategories

  # Columns of index page
  index do
    selectable_column
    id_column
    column :name
    column :city
    column :state
    column :zip_code
    column :published
    actions 
  end

  show do |sp|
    attributes_table do
      rows  :id, :name, :image, :remote_image_url, :website,
            :providers_email, :contact_person, :contact_email, 
            :street1, :street2, :city, :state, :zip_code, 
            :work_phone, :fax, :published, :other
    end

    panel "Categories - Subcategories", :class => 'subcatPanel' do
      attributes_table_for "subcat" do 
        if service_provider.subcategories.empty?
          row 'Category/Subcategory'
        else
          service_provider.uniq_categories.each do |cat|
            row cat.name do
              service_provider.subcategories.map do |subcat|
                subcat.name if subcat.category == cat
              end .compact.join("<br>").html_safe
            end
          end 
        end # End of If-Else
      end # End of attributes_table_for

      ul do 
        button('Edit Subcategories', :class => 'edit_subcat_button')
      end

    end # End of Cat/Subcat panel

    render partial: 'edit_subcat', locals: {service_provider: service_provider,
                                            categories: Category.all,
                                            selected_subcategories: service_provider.subcategories}
  end

  # CONTROLLER
  member_action :update_subcat, method: :post do 
    service_provider = ServiceProvider.find(params[:id])    
    subcategory_ids = params[:subcategories]
    service_provider.subcategories.clear
    if subcategory_ids
      subcategory_ids.each do |subcat_id|
        service_provider.subcategories << Subcategory.find_by_id(subcat_id)
      end
    end
    redirect_to admin_service_provider_path(service_provider), 
                notice: "Subcategories for this provider have been updated"
  end


  # FILTERS on sidebar
  filter :subcategories
  filter :name
  filter :city
  filter :state
  filter :zip_code
  filter :published
end
