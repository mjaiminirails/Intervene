class CreateJoinTableReferralsServiceProviders < ActiveRecord::Migration
  def change
    create_table :referrals_service_providers, :id => false do |t|
      t.belongs_to :referral
      t.belongs_to :service_provider
    end
  end
end
