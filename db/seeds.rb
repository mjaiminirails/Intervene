require 'csv'

#-------- POPULATE INTERVENTION TYPES ---------
CSV.foreach("./db/InterventionType.csv", :headers => true, :col_sep => "|") do |obj|
	InterventionType.create(name: obj[0], description: obj[1])
end


# ---------- POPULATE CATEGORIES ----------
CSV.foreach("./db/Category.csv", :headers => true) do |obj|
	Category.create(name: obj[0])
end

# ---------- POPULATE SUBCATEGORIES ----------
CSV.foreach("./db/Subcategory.csv", :headers => true) do |obj|
	Subcategory.create(name: obj[0])
end

#-------- SERVICE PROVIDERS ---------
prov1 = ServiceProvider.create( name: 'Hidden Gems Archery',
												mission: 'to bring archery to the masses',
												# remote_image_url:'http://www.hiddengemsarchery.com/wp-content/uploads/2013/02/cropped-Screen-Shot-2013-02-12-at-11.45.43-AM-e1360885247611.png',
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


# --- CREATE SAMPLE RELATIONSHIP BETWEEN SERVICE PROVIDER AND INTERVENTION TYPE ----
# type1 = InterventionType.all[1]
# type4 = InterventionType.all[4]
# type13 = InterventionType.all[13]


# prov1.intervention_types << type1 << type4
# prov2.intervention_types << type1 << type13




# --- CREATE SAMPLE RELATIONSHIP BETWEEN SERVICE PROVIDER AND CATEGORY ----


category1 = Category.all[0]
category2 = Category.all[1]
category3 = Category.all[2]
category4 = Category.all[3]
category5 = Category.all[4]

prov1.categories << category1 << category2
prov2.categories << category1 << category5

# -- CREATE SUBCATEGORY ---
#Academic Support (cat1)
subcat1 = Subcategory.all[0]
subcat2 = Subcategory.all[1]
subcat3 = Subcategory.all[2]
subcat4 = Subcategory.all[3]
subcat5 = Subcategory.all[4]
subcat6 = Subcategory.all[5]


#Arts (cat 2)
subcat7 = Subcategory.all[6]
subcat8 = Subcategory.all[7]
subcat9 = Subcategory.all[8]
subcat10 = Subcategory.all[9]


#Sports (cat 3)
subcat11 = Subcategory.all[10]
subcat12 = Subcategory.all[11]
subcat13 = Subcategory.all[12]
subcat14 = Subcategory.all[13]
subcat15 = Subcategory.all[14]

#Counseling (cat 4)
subcat16 = Subcategory.all[15]
subcat17 = Subcategory.all[16]
subcat18 = Subcategory.all[17]
subcat19 = Subcategory.all[18]
subcat20 = Subcategory.all[19]
subcat21 = Subcategory.all[20]
subcat22 = Subcategory.all[21]
subcat23 = Subcategory.all[22]

#Mentoring #5
subcat24 = Subcategory.all[23]

# -- CREATE SAMPLE RELATIONSHIP BETWEEN CATEGORY AND SUBCATEGORY --

category1.subcategories << subcat1 << subcat2 << subcat3 <<subcat4 << subcat5 << subcat6

category2.subcategories << subcat7 << subcat8 << subcat9 << subcat10

category3.subcategories <<  subcat11 << subcat12 << subcat13 << subcat14 << subcat15

category4.subcategories << subcat16 << subcat17 << subcat18 << subcat19 << subcat20 << subcat21 << subcat22 << subcat23

category5.subcategories << subcat24


# --- CREATE SAMPLE RELATIONSHIP CATEGORY AND INTERVENTION TYPE ----
#1  Parent Outreach
#2 Short-Term Guidance  Conference
#3 Individual behavior Contract
#4 Intervention by Counseling
#5 PPT
#6 CBO
#7 Substance Abuse
#8 Indiv. Group Counseling
#9 Community  Service
#10 Mentoring
#11 Mentor/Coach assignment
#12 Counseling bullying, intimidation, harassment
#13 Youth relationship, sexual violence

 type6 = InterventionType.all[6]
 type8 = InterventionType.all[8]
 type13 = InterventionType.all[13]
 type10 = InterventionType.all[10]
 type4 = InterventionType.all[4]
  type12 = InterventionType.all[12]


 category1.intervention_types << type6
 category2.intervention_types << type6 << type8
 category4.intervention_types << type4 << type8 << type12 << type13



