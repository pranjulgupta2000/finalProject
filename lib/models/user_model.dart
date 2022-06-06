// class UserModel {
//   late String email;
//   late String? firstName;
//   late String? lastName;
//   late String? password;
//   late String? userid;

//   factory UserModel.fromMap(map) {
//     return UserModel(
//       uid: map['uid'],
//       email: map['email'],
//     );
//   }
//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uid,
//     };
//   }

//   UserModel({
//     this.uid,
//     this.email,
//   });
// }

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

  static fromJson(Map<String, dynamic> data) {}
}
