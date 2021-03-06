class DepartmentalGraduatesB {

  String highSchool;
  String college;
  String collegeGraduationYear;
  String autoBio;
  String bestMoment;
  String whyCourseOfStudy;
  String dob;
  String email;
  String facebook;
  String highSchoolGraduationYear;
  String hobbies;
  String id;
  String image;
  String instagram;
  String linkedIn;
  String myDropline;
  String name;
  String nickname;
  String philosophy;
  String phone;
  String favouriteCourse;
  String departmentExecutive;
  String departmentExecutivePosition;
  String favouriteLocationOnCampus;
  String favoriteSportOnCampus;
  String favoriteSchoolActivity;
  String constituentCountry;
  String regionFrom;
  String twitter;
  String whatsNext;
  String worstMoment;
  String occupation;

  DepartmentalGraduatesB.fromMap(Map<String, dynamic> data) {

    highSchool = data['high_school'];
    college = data['college'];
    whyCourseOfStudy = data['why_this_course'];
    highSchoolGraduationYear = data['high_school_graduation_year'];
    collegeGraduationYear = data['college_graduation_year'];
    linkedIn = data['linkedIn'];
    whatsNext = data['whats_next'];
    constituentCountry = data['constituent_country'];
    regionFrom = data['region_from'];
    favouriteCourse = data['fav_subject'];
    departmentExecutive = data['department_executive'];
    departmentExecutivePosition = data['department_executive_position'];
    favouriteLocationOnCampus = data['fav_place_in_campus'];
    favoriteSportOnCampus = data['fav_sport_in_campus'];
    favoriteSchoolActivity = data['fav_school_activity'];
    id = data['id'];
    autoBio = data['autobio'];
    bestMoment = data['best_moment'];
    email = data['email'];
    facebook = data['facebook'];
    image = data['image'];
    instagram = data['instagram'];
    name = data['name'];
    nickname = data['nickname'];
    phone = data['phone'];
    twitter = data['twitter'];
    dob = data['d_o_b'];
    hobbies = data['hobbies'];
    myDropline = data['my_dropline'];
    philosophy = data['philosophy'];
    worstMoment = data['worst_moment'];
    occupation = data['occupation'];
  }

}