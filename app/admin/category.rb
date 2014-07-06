ActiveAdmin.register Category do

  menu parent: 'Variables'

  remove_filter :categories_intervention_types
  
  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  show do |cat|
    attributes_table do
      row :id
      row :name
      row 'Subcategories' do
        cat.subcategories.each do |subcat| 
          li link_to subcat.name, admin_subcategory_path(subcat)
        end
      end 
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
