class UserModel {
  String email;
  String firstName;
  String lastName;

  String userid;
  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.userid,
  });
  Map<String, dynamic> toJSON() => {
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "userid": userid,
      };
  UserModel.fromJson(Map<String, dynamic> map)
      : email = map["email"],
        firstName = map["firstName"],
        lastName = map["lastName"],
        userid = map["userid"];
}
