#encoding: utf-8
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

# ------ Create Dummy Admin User if there isn't already one ------

someone = AdminUser.find_by_email("admin@example.com")

AdminUser.create(email: "admin@example.com",
                                    password: "password",
                                    password_confirmation: "password") unless someone
#New York State is a school system that will have many counties. You can look at:  http://data.nysed.gov/lists.php?type=county

app_user = AppUser.create(email: 'user@example.com',
    first_name: 'user',
    last_name: 'example',
    password: 'password',
    password_confirmation: 'password',
    school_id: 1
    )

system1 = SchoolSystem.create(name: "New York State Department of Education",
                    contact_person: "Yolanda Smith",
                    contact_email: "ysmith@nysed.com",
                    title: "Assistant Director",
                    website:"nysed.com",
                    street1: "100 Lane",
                    street2: "room 315",
                    city: "Bx",
                    state: "NY",
                    zip_code: "11201",
                    phone: "2123456789",
                    fax: "2123456789"
                    )

#Counties will belong to a system and have many districts. You can look at:  http://data.nysed.gov/lists.php?type=county
county1 = SchoolCounty.create(name: "Bronx County",
                    contact_person: "Yolanda Smith",
                    contact_email: "ysmith@bxcounty.com",
                    title: "director",
                    street1: "100 Lane",
                    street2: "Rm 104",
                    city: "Bx",
                    state: "NY",
                    zip_code: "11201",
                    phone: "7183456789",
                    fax: "7183456789",
                    website: "bxcounty.com",
                    school_system_id: "1")

#Districts will belong to a county and have many schools. You can look at: http://data.nysed.gov/profile.php?county=32
district1 = SchoolDistrict.create(name: 'NEW YORK CITY GEOGRAPHIC DISTRICT #10',
                     contact_person: "Brian Smith",
                    contact_email: "bsmith@bxdistrict.com",
                    title: "Superintendent",
                    street1: "100 Lane",
                    street2: "Rm 104",
                    city: "NY",
                    state: "NY",
                    zip_code: "11201",
                    phone: "2123456789",
                    fax: "2123456789",
                    website: "nycdoe.com",
                    school_county_id: "1" )


#Schools will belong to a district. You can look at http://data.nysed.gov/profile.php?instid=800000045624, as a reference
school1 = School.create(
              name:"DWCHS",
              principal: "Santiago Taveras",
              mission:"sine labore nihil",
                   contact_person: "Alex Castillo",
                    contact_email: "acastillo@dwchs.com",
                    title: "Assistant Principal",
                    street1: "100 Lane",
                    street2: "Rm 104",
                    city: "NY",
                    state: "NY",
                    zip_code: "11201",
                    phone: "2123456789",
                    fax: "2123456789",
                    website: "dwchs.com",

              school_district_id: 1,
              grade_configuration_id: 1,
              school_type_id: 1,
              grade_type_id: 1
              )

# --- Dummy Sample School

school2 = School.create(
                        name: "Parkway Center City High School",
                        mission: "The mission of the School District of Philadelphia is to provide a high-quality education that prepares, ensures, and empowers all students to achieve their full intellectual and social potential in order to become lifelong learners and productive members",
                        website: "http://www.phila.k12.pa.us/",
                        street1: "540 N 13th St",
                        street2: "room 3",
                        city: "Philadelphia",
                        state: "PA",
                        zip_code: "19123",
                        phone: "215-351-7095",
                        fax: nil,
                        school_district_id: 1,
                        school_type_id: 2
                        )
# -- Service Providers Sample

prov1 = ServiceProvider.create( name: 'Hidden Gems Archery',
                               mission: 'to bring archery to the masses',
                               # remote_image_url:'http://www.hiddengemsarchery.com/wp-content/uploads/2013/02/cropped-Screen-Shot-2013-02-12-at-11.45.43-AM-e1360885247611.png',
                               website: 'http://www.hiddengemsarchery.com/',
                               contact_person: 'q',
                               contact_email:'q@hga@aol.com',
                               general_email: 'info@thehiddengems.com',
                               street1: '180 Remson Street',
                               street2: '', city:'Bronx',
                               state:'NY',
                               zip_code:'10469',
                               phone:'254-247-4477',
                               fax:'',
                               other:'')

prov2 = ServiceProvider.create( name: 'Cardinal McCloskey' ,
                               mission: 'Our At-Risk Services’ mission is to promote a safe and nurturing environment for at-risk children and youth and the goal is to keep children safe, prevent abuse and strengthen biological families.',
                               remote_image_url: '',
                               website: 'http://www.cmcs.org/',
                               contact_person: 'cardinal',
                               contact_email:'cardinal@hga@aol.com',
                               general_email: 'MHess@cmcs.org',
                               street1: '953 Southern Blvd.',
                               street2: 'Room 303',
                               city:'Bronx', state:'NY',
                               zip_code:'10459',
                               phone:'718-542-0255',
                               fax:'',
                               other:'')

s1 = ServiceProvider.create(
    name: 'Hidden Gems Archery' ,
    mission: 'to bring archery to the masses',
    image:'http://www.hiddengemsarchery.com/wp-content/uploads/2013/02/cropped-Screen-Shot-2013-02-12-at-11.45.43-AM-e1360885247611.png',
    remote_image_url: '',
    website: 'http://www.hiddengemsarchery.com/',
    general_email: 'info@hiddengems.com ',
    contact_person: 'q',
    contact_email:'q@hga@aol.com',
    title: 'intake person',
    street1: '180 Remson Street',
    street2: '',
    city:'Bronx',
    state:'NY',
    zip_code:'10469',
    phone:'254-247-4477',
    fax:'',
    published:'true',
    other:'Great place to have fun.'
    )



#grade configuration; create a table of values
grade1 = GradeConfiguration.create(name:"9"
                                   )
grade2 = GradeConfiguration.create(name: "10")
grade3 = GradeConfiguration.create(name: "11")
grade4 = GradeConfiguration.create(name: "12")

#type indicates what group
grade_type1 = GradeType.create(name:"Early Childhood")
grade_type2 = GradeType.create(name:"Elementary")
grade_type3 = GradeType.create(name:"Junior High")
grade_type4 = GradeType.create(name:"Intermediate")
grade_type5 = GradeType.create(name:"High School")
grade_type6 = GradeType.create(name:"High School through College")

school_type1 = SchoolType.create(name: "Public School")
school_type2 = SchoolType.create(name: "Private")
school_type3 = SchoolType.create(name: "Magnet")
school_type4 = SchoolType.create(name: "Charter")


#student
stud1 = Student.create(image_url: '1.jpeg', first_name: 'John', last_name: 'Doe', identification_number: '123456789',  date_of_birth: '12/13/99', school_id:'1', email: 'student@gmail.com', street1: ' 123 Main Street', street2: '', city: 'Bronx', zip_code: '10469', phone:'718-231-1000', cell_phone:'646-1000',  counselor: 'Ms.Nice', cohort: '2018', grade_level: '9', gender:'male')


c1 = Category.create(name: 'sports')
sc1 = Subcategory.create(name: 'archery')

c1.subcategories << sc1
s1.subcategories << Subcategory.all[0]


#referral
r1 = Referral.create( comment: 'Student needs some help with anger issues', app_user_id: '1' , student_id: '1', school_id: '1' )
 r1.service_providers << ServiceProvider.all[0]

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
# 7 Referral to a Community Based Organization (CBO)    ====> academic_support, art
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







