import 'package:firebase/Helper.dart';
import 'package:firebase/pages/intropage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'admins/Login.dart';
import 'admins/signup.dart';
import 'models/cart.dart';
final auth = FirebaseAuth.instance;
main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
          home: IntroPage(),
      ),
    );
  }
}



