# There will be 24 tables in the model
# $ rails generate migration
[x] + create migration for devise_create_admin_users
[x] + create migration for create_school_systems
[x] + create migration for create_school_counties ; t.belongs_to :school_system
[x] + create migration for create_school_districts; t.belongs_to :school_county
[x] + create migration for create_schools; t.belongs_to  :school_district
[x] + create migration for create_grade_configurations; 't.belongs_to :school'
[x] + create migration for create_school_types; 't.belongs_to :school'
[x] + create migration for create_grade_types; 't.belongs_to :school'
[x] + create migration for create_app_users; 't.belongs_to :school'
[x] + create migration for create_roles
[x] + create migration for create_join_table_app_users_roles


[x] + create migration for create_referrals; 't.belongs_to :school;
t.belongs_to :app_user; t.belongs_to :student; t.belongs_to :school;'
[x] + create migration for create_service_providers
[x] + create migration for create_join_table_referrals_service_providers
[x] + create migration for create_students; 't.belongs_to :school;'
[x] + create migration for create_guardians
[x] + create migration for create_guardian_roles
[x] + create migration for create_join_table_guardians_students
[x] + create migration for categories
[x] + create migration for create_subcategories; 't.belongs_to :category'
[x] + create migration for create_service_providers_subcategories
[x] + create migration for create_intervention_types
[x] + create migration for create_join_table_intervention_types_subcategories



{go to the singular model of the plural word} {association to make} :{name to write}

# --- school system
[x] school_system has_many school_counties
[x] school_county belongs_to school_system
[x] ~ in migration for create_school_counties 't.belongs_to :school_system'

# --- school county
[x] school_county has_many school_districts
[x] school_district belongs_to school_county
[x] ~ in migration for create_school_districts 't.belongs_to :school_county'

# --- school district
[x] school_district has_many schools
[x] school belongs_to school_district
[x] ~ in migration for create_schools 't.belongs_to :school_district'

# --- school
[x] school has_many grade_configurations
[x] grade_configuration belongs_to school
[x] ~ in migration for create_grade_configurations 't.belongs_to :school'

[x] school has_one school_type
[x] school_type belongs_to school
[] ~ in migration for create_school_types 't.belongs_to :school'

[x] school has_many grade_types
[x] grade_type belongs_to school
[x] ~ in migration for create_grade_types 't.belongs_to :school'

[x] school has_many app_users
[x] app_user belongs_to school
[x] ~ in migration for create_app_users 't.belongs_to :school'

[x] school has_many referrals
[x] referral belongs_to school
[x] ~ in migration for create_referrals 't.belongs_to :school'

[x] school has_many students
[x] student belongs_to school
[x] ~ in migration for create_students 't.belongs_to :school'

# --- app_users
[x] app_user has_and_belongs_to_many roles
[x] role has_and_belongs_to_many app_users
[x] ~ in migration for create_join_table_app_users_roles
   create_table :app_users_roles, :id => false do |t|
      t.belongs_to :app_user
      t.belongs_to :role
    end
~

# --- referrals
[x] referral has_many students
[x] student belongs_to referral
[x] ~ in migration for create_students 't.belongs_to :referral'

[x] referral has_and_belongs_to_many service_providers
[x] service_provider has_and_belongs_to_many referrals
[x] ~ in migration for create_join_table_referrals_service_providers
create_table :referrals_service_providers, :id => false do |t|
      t.belongs_to :referral
      t.belongs_to :service_provider
    end
~

# --- students
[x] student has_and_belongs_to_many guardians
[x] guardian has_and_belongs_to_many students
[x] ~ in migration for create_join_table_guardians_students
create_table :guardians_students, :id => false do |t|
      t.belongs_to :guardian
      t.belongs_to :student
    end
~

# --- guardians
[x] guardian has_one guardian_role
[x] guardian_role belongs_to guardian
[x] ~ in migration for create_guardian_roles 't.belongs_to :guardian'

# --- service_providers
[x] service_provider has_and_belongs_to_many subcategories
[x] subcategory has_and_belongs_to_many service_providers
[x] ~ in migration for create_join_table_service_providers_subcategories

- create_table :service_providers_subcategories, :id => false do |t|
       t.belongs_to :service_provider
      t.belongs_to :subcategory
      t.timestamps
-   end
~

# --- subcategories
[x] subcategory belongs_to category
[x] ~ in migration for create_subcategories 't.belongs_to :category'


# --- intervention_types
[x] intervention_type has_and_belongs_to_many subcategories
[x] subcategory has_and_belongs_to_many intervention_types
[x] ~ in migration for create_join_table_intervention_types_subcategories
create_table :intervention_types_subcategories, :id => false do |t|
      t.belongs_to :intervention_type
      t.belongs_to :subcategory
    end
~

