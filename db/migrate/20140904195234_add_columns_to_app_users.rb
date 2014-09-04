class AddColumnsToAppUsers < ActiveRecord::Migration
  def change
    add_column :app_users, :user_name, :string
    add_column :app_users, :first_name, :string
    add_column :app_users, :last_name, :string
    add_column :app_users, :school_id, :int
    add_column :app_users, :service_provider_id, :int
  end
end
