# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'csv'

#-------- POPULATE INTERVENTION TYPES ---------
CSV.foreach("./db/InterventionType.csv", :headers => true, :col_sep => "|") do |obj|
	InterventionType.create(name: obj[0], description: obj[1])
end

#-------- SERVICE PROVIDERS ---------
prov1 = ServiceProvider.create( name: 'Hidden Gems Archery', 
												mission: 'to bring archery to the masses', 
												remote_image_url:'http://www.hiddengemsarchery.com/wp-content/uploads/2013/02/cropped-Screen-Shot-2013-02-12-at-11.45.43-AM-e1360885247611.png',
												website: 'http://www.hiddengemsarchery.com/', 
												contact_person: 'q', 
												contact_email:'q@hga@aol.com', 
												providers_email: 'info@thehiddengems.com', 
												street1: '180 Remson Street', 
												street2: '', city:'Bronx', 
												state:'NY', 
												zip_code:'10469', 
												work_phone:'254-247-4477', 
												fax:'', 
												other:'')



prov2 = ServiceProvider.create( name: 'Cardinal McCloskey' , 
												mission: 'Our At-Risk Services’ mission is to promote a safe and nurturing environment for at-risk children and youth and the goal is to keep children safe, prevent abuse and strengthen biological families.', 
												remote_image_url: '', 
												website: 'http://www.cmcs.org/', 
												contact_person: 'cardinal', 
												contact_email:'cardinal@hga@aol.com', 
												providers_email: 'MHess@cmcs.org', 
												street1: '953 Southern Blvd.', 
												street2: 'Room 303', 
												city:'Bronx', state:'NY', 
												zip_code:'10459', 
												work_phone:'718-542-0255', 
												fax:'', 
												other:'')

#--- CREATE SAMPLE RELATIONSHIP BETWEEN SERVICE PROVIDER AND INTERVENTION TYPE ----
type1 = InterventionType.all[1]
type4 = InterventionType.all[4]
type13 = InterventionType.all[13]


prov1.intervention_types << type1 << type4
prov2.intervention_types << type1 << type13

