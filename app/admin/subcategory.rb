ActiveAdmin.register Subcategory do

  menu parent: 'Categories'

  remove_filter :subcategories_service_providers

  permit_params :name, :category_id

  show do |subcat|
    attributes_table do
      row :id
      row :name
      row :category
    end
  end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
