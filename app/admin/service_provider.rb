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

  # # New and Edit form 
  # form do |f|
  #   f.inputs "Service Provider Details" do
  #     f.input :name
  #     f.input :city
  #     f.input :state
  #     f.input :zip_code
  #     f.input :website
  #     f.input :published, as: :check_boxes
  #     # f.input :service_categories, :as => :check_boxes
  #   end
  #   f.actions
  # end

end
