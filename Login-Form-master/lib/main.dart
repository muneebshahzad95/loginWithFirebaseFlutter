import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginform/classes/googlesignin.dart';
import 'package:loginform/classes/utils_snackbar.dart';
import 'package:provider/provider.dart';

import 'screens/loginpage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (create) => GoogleSignInProvider(),
      child: MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ));
}
