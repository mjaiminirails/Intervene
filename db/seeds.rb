#encoding: utf-8
require 'csv'

#New York State is a school system that will have many counties. You can look at:  http://data.nysed.gov/lists.php?type=county


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

app_user = AppUser.create(email: 'user@example.com',
    first_name: 'user',
    last_name: 'example',
    password: 'password',
    password_confirmation: 'password',
    school_id: 1
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


#referral
r1 = Referral.create( comment: 'Student needs some help with anger issues', app_user_id: '4' , student_id: '2', school_id: '1' )

