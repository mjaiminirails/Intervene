class CreateJoinTableAppUsersRoles < ActiveRecord::Migration
  def change
      create_table :app_users_roles, :id => false do |t|
      t.belongs_to :role
      t.belongs_to :app_user
  end
 end
end
