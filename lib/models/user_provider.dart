// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:test/models/user_model.dart';


// Firebase.Auth.FirebaseUser user = auth.CurrentUser;
// if (user != null) {
//   string name = user.DisplayName;
//   string email = user.Email;

//   // The user's Id, unique to the Firebase project.
//   // Do NOT use this value to authenticate with your backend server, if you
//   // have one; use User.TokenAsync() instead.
//   string uid = user.UserId;
// }

// // class UserProvider with ChangeNotifier {
// //   late UserModel currentData;

// //   void getUserData() async {
// //     UserModel userModel;
// //     var value = await FirebaseFirestore.instance
// //         .collection("usersData")
// //         .doc(FirebaseAuth.instance.currentUser?.uid)
// //         .get();
// //     if (value.exists) {
// //       userModel = UserModel(
// //         firstName: value.get("firstName"),
// //         lastName: value.get("lastName"),
// //         email: value.get("email"),
// //         userid: value.get("userid"),
// //       );
// //       currentData = userModel;
// //       notifyListeners();
// //     }
// //   }

// //   UserModel get currentUserData {
// //     print(currentData.firstName);
// //     return currentData;
// //   }
// // }
