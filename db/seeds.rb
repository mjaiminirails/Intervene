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

# ---------- SET UP CATEGORY + SUBCATEGORY RELATIONSHIPS ----------
academic_support = Category.all[0]
art = Category.all[1]
sport = Category.all[2]
counseling = Category.all[3]
mentoring = Category.all[4]
job_internship = Category.all[5]

all_subcats = Subcategory.all.to_a

# Subcategory IDs: 1 to 6
academic_support.subcategories = all_subcats.shift(6) 

# Subcategory IDs: 7 to 10
art.subcategories = all_subcats.shift(4)

# Subcategory IDs: 11 to 15
sport.subcategories = all_subcats.shift(5)

# Subcategory IDs: 16 to 23
counseling.subcategories = all_subcats.shift(8)

# Subcategory IDs: 24
mentoring.subcategories = all_subcats.shift(1)



#-------- DUMMY SERVICE PROVIDERS ---------
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

# --- Dummy Sample Subcategory + Service Provider relationship
prov1.subcategories << Subcategory.where(name: 'Archery')

prov2_subcats = [	'Individual Counseling', 
									'Group Counseling',
									'Youth Relationship Counseling',
									'Mentoring']
prov2_subcats.each do |sc|
	prov2.subcategories << Subcategory.where(name: sc)
end



# --- CREATE SAMPLE RELATIONSHIP SUBCATEGORY AND INTERVENTION TYPE ----
# ---   done by populating all subcategories (per category) with respective intervention types
#
# ID | Intervention Type Name
# ------------------------------
# 1 Parent Outreach
# 2 Short-Term Behavioral Progress Reports
# 3 Guidance Conference
# 4 Development of Individual Behavior Contract
# 5 Intervention by Counseling Staff ===> counseling, 
# 6 Referral to PPT (Pupil Personnel Team)
# 7 Referral to a Community Based Organization (CBO) 	====> academic_support, art
# 8 Referral to Appropriate Substance Abuse Counseling Services
# 9 Individual/Group Counseling ===> art, counseling
# 10 Community Service (with Parental Consent)
# 11 Mentoring Program
# 12 Mentor/Coach
# 13 Referral to Counseling Services for Bias-Based Bullying, Intimidation or Harassment ==> counseling
# 14 Referral to Counseling Services for Youth Relationship Abuse or Sexual Violence ===> counseling

cbo = InterventionType.find_by_id(7)
counsel_staff = InterventionType.find_by_id(5)
indiv_grp_counsel = InterventionType.find_by_id(9)
mentoring_type = InterventionType.find_by_id(11)
bully = InterventionType.find_by_id(13)
abuse_violence = InterventionType.find_by_id(14)


academic_support.subcategories.each do |scat|
	scat.intervention_types << cbo
end

art.subcategories.each do |scat|
	scat.intervention_types << indiv_grp_counsel
end

counseling.subcategories.each do |scat|
	scat.intervention_types << counsel_staff << indiv_grp_counsel << bully << abuse_violence
end

mentoring.subcategories.each do |scat|
	scat.intervention_types << mentoring_type	
end



# --- CREATE SAMPLE RELATIONSHIP BETWEEN SERVICE PROVIDER AND INTERVENTION TYPE ----
# type1 = InterventionType.all[1]
# type4 = InterventionType.all[4]
# type13 = InterventionType.all[13]


# prov1.intervention_types << type1 << type4
# prov2.intervention_types << type1 << type13

# prov1.categories << academic_support << art
# prov2.categories << academic_support << mentoring


