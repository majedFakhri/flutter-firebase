class UsersModel {
  int id;
  String firstNameArabic;
  String middleNameArabic;
  String lastNameArabic;
  String firstNameEnglish;
  String middleNameEnglish;
  String lastNameEnglish;
  String specialization;
  String country;
  String email;
  String birth;
  int phone;
  String password;
  int type;
  int isActive;

  UsersModel(
      {required this.id,
      required this.firstNameArabic,
      required this.middleNameArabic,
      required this.lastNameArabic,
      required this.firstNameEnglish,
      required this.middleNameEnglish,
      required this.lastNameEnglish,
      required this.specialization,
      required this.country,
      required this.birth,
      required this.phone,
      required this.email,
      required this.password,
      required this.type,
      required this.isActive});

  factory UsersModel.fromjson(Map<String, dynamic> json) {
    return UsersModel(
        id: json['id'] as int,
        firstNameArabic: json['first_name_ar'] as String,
        middleNameArabic: json['middle_name_ar'] as String,
        lastNameArabic: json['last_name_ar'] as String,
        firstNameEnglish: json['first_name_en'] as String,
        middleNameEnglish: json['middle_name_en'] as String,
        lastNameEnglish: json['last_name_en'] as String,
        specialization: json['specialization'] as String,
        country: json['country'] as String,
        birth: json['birthday'] as String,
        phone: json['phone'] as int,
        email: json['email'] as String,
        password: json['password'] as String,
        type: json['type'] as int,
        isActive: json['is_active'] as int);
  }
}

class GetAllUsers {
  List<UsersModel> getAll;

  GetAllUsers({required this.getAll});

  factory GetAllUsers.fromJson(Map<String, dynamic> json) {
    return GetAllUsers(
      getAll: List<UsersModel>.from(
        json['data'].map(
          (x) => UsersModel.fromjson(x),
        ),
      ),
    );
  }
}

class GetAllStudents {
  List<UsersModel> getAll;

  GetAllStudents({required this.getAll});

  factory GetAllStudents.fromJson(Map<String, dynamic> json) {
    return GetAllStudents(
      getAll: List<UsersModel>.from(
        json['data'].map(
          (x) => UsersModel.fromjson(x),
        ),
      ),
    );
  }
}

class GetAllTeachers {
  List<UsersModel> getAll;

  GetAllTeachers({required this.getAll});

  factory GetAllTeachers.fromJson(Map<String, dynamic> json) {
    return GetAllTeachers(
      getAll: List<UsersModel>.from(
        json['data'].map(
          (x) => UsersModel.fromjson(x),
        ),
      ),
    );
  }
}

class GetAllTeachersFirstName {
  List<UsersModel> getAll;
  GetAllTeachersFirstName({required this.getAll});
  factory GetAllTeachersFirstName.fromJson(Map<String, dynamic> json) {
    return GetAllTeachersFirstName(
      getAll: List<UsersModel>.from(
        json['data']['first_name_ar'].map(
          (x) => UsersModel.fromjson(x),
        ),
      ),
    );
  }
}
