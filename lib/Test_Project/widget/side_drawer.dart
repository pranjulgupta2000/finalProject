import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test/Test_Project/cart_page.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 136, 134, 126),
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(''),
            accountEmail: Text(
              user.email.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://thumbs.dreamstime.com/b/little-kid-avatar-profile-picture-girls-face-bandana-cartoon-character-portrait-isolated-vector-illustration-graphic-design-149130285.jpg"),
            ),
            onDetailsPressed: () {},
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://media.istockphoto.com/photos/close-up-of-a-black-slate-texture-background-stone-grunge-texture-picture-id1268759368?k=20&m=1268759368&s=612x612&w=0&h=poPTKCg-I0ACjPN3NcMWu236zB86YGBQQaaiVo3vQbo="),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            title: const Text('Profile', style: TextStyle(color: Colors.white)),
            leading: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            onLongPress: () {},
          ),
          const Divider(),
          ListTile(
              title: Text('Cart', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.shopping_basket, color: Colors.white),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              }),
          Divider(),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
