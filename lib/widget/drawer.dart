// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:test/cart_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:test/models/user_provider.dart';

// class DrawerMenu extends StatelessWidget {
//   //static userData? user = FirebaseAuth.instanceFor(app: app);
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//         backgroundColor: Color.fromARGB(255, 136, 134, 126),
//         child: ListView(padding: EdgeInsets.all(0.0), children: <Widget>[
//           UserAccountsDrawerHeader(
//             accountName: Text('Riya'),
//             accountEmail: Text('riya@gmail.com'),
//             currentAccountPicture: CircleAvatar(
//               backgroundImage: ExactAssetImage('images/profile.jpg'),
//             ),
//             onDetailsPressed: () {},
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage("images/background.jpg"),
//                     fit: BoxFit.cover)),
//           ),
//           ListTile(
//             title: Text('Profile', style: TextStyle(color: Colors.white)),
//             leading: Icon(
//               Icons.person,
//               color: Colors.white,
//             ),
//             onLongPress: () {},
//           ),
//           Divider(),
//           ListTile(
//               title: Text('Cart', style: TextStyle(color: Colors.white)),
//               leading: Icon(Icons.shopping_basket, color: Colors.white),
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => CartPage()));
//               }),
//           Divider(),
//           ListTile(
//               title: Text(
//                 'Logout',
//                 style: TextStyle(color: Colors.white),
//               ),
//               leading: Icon(
//                 Icons.logout,
//                 color: Colors.white,
//               ),
//               onTap: () async {
//                 await FirebaseAuth.instance.signOut();
//               }),
//         ]));
//   }
// }
