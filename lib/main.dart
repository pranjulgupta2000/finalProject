import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/Test_Project/providers/provider_page.dart';
import 'package:test/splash_screen.dart';
import 'Test_Project/homepage_2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBGN2fSBAab6j6pfc1cBQhCMR_RBHzWjhc',
      appId: '1:768294231240:web:71e5635fb7ea39d6b759fd',
      messagingSenderId: '768294231240',
      projectId: 'food-order-app-9ca99',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff2b2b2b),
          appBarTheme: const AppBarTheme(
            color: Color(0xff2b2b2b),
          ),
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (index, sncpshot) {
              if (sncpshot.hasData) {
                return MyHomePage();
              }
              return SplashScreen();
            }),
      ),
    );
  }
}
