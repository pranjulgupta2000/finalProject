// import 'package:flutter/cupertino.dart';

// class AuthController extends ChangeNotifier{
//   static AuthController instance = Get.find();
//   late Rx<User?> _user;
//   bool isLoging = false;
//   User? get user => _user.value;
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   @override
//   void onReady() {
//     super.onReady();
//     _user = Rx<User?>(auth.currentUser);
//     _user.bindStream(auth.authStateChanges());
//     ever(_user, loginRedirect);
//   }

//   loginRedirect(User? user) {
//     Timer(Duration(seconds: isLoging ? 0 : 2), () {
//       if (user == null) {
//         isLoging = false;
//         update();
//         Get.offAll(() => const LoginScreen());
//       } else {
//         isLoging = true;
//         update();
//         Get.offAll(() => const HomeScreen());
//       }
//     });
//   }

//   void registerUser(email, password) async {
//     try {
//       isLoging = true;
//       update();
//       await auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       getSuccessSnackBar("Successfully logged in as ${_user.value!.email}");
//     } on FirebaseAuthException catch (e) {
//       //define error
//       getErrorSnackBar("Account Creating Failed", e);
//     }
//   }

//   void login(email, password) async {
//     try {
//       isLoging = true;
//       update();
//       await auth.signInWithEmailAndPassword(email: email, password: password);
//       getSuccessSnackBar("Successfully logged in as ${_user.value!.email}");
//     } on FirebaseAuthException catch (e) {
//       //define error
//       getErrorSnackBar("Login Failed", e);
//     }
//   }

//   void googleLogin() async {
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//     isLoging = true;
//     update();
//     try {
//       googleSignIn.disconnect();
//       // ignore: empty_catches
//     } catch (e) {}
//     try {
//       final GoogleSignInAccount? googleSignInAccount =
//           await googleSignIn.signIn();
//       if (googleSignInAccount != null) {
//         final GoogleSignInAuthentication? googleAuth =
//             await googleSignInAccount.authentication;
//         final crendentials = GoogleAuthProvider.credential(
//           accessToken: googleAuth?.accessToken,
//           idToken: googleAuth?.idToken,
//         );
//         await auth.signInWithCredential(crendentials);
//         getSuccessSnackBar("Successfully logged in as ${_user.value!.email}");
//       }
//     } on FirebaseAuthException catch (e) {
//       getErrorSnackBar("Google Login Failed", e);
//     } on PlatformException catch (e) {
//       getErrorSnackBar("Google Login Failed", e);
//     }
//   }

//   void forgorPassword(email) async {
//     try {
//       await auth.sendPasswordResetEmail(email: email);
//       getSuccessSnackBar("Reset mail sent successfully. Check mail!");
//     } on FirebaseAuthException catch (e) {
//       getErrorSnackBar("Error", e);
//     }
//   }

//   getErrorSnackBar(String message, _) {
//     Get.snackbar(
//       "Error",
//       "$message\n${_.message}",
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: MyTheme.redTextColor,
//       colorText: Colors.white,
//       borderRadius: 10,
//       margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
//     );
//   }

//   getErrorSnackBarNew(String message) {
//     Get.snackbar(
//       "Error",
//       message,
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: MyTheme.redTextColor,
//       colorText: Colors.white,
//       borderRadius: 10,
//       margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
//     );
//   }

//   getSuccessSnackBar(String message) {
//     Get.snackbar(
//       "Success",
//       message,
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: MyTheme.greenTextColor,
//       colorText: Colors.white,
//       borderRadius: 10,
//       margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
//     );
//   }

//   void signOut() async {
//     await auth.signOut();
//   }
// }