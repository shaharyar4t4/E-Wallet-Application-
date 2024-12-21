import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/firebase_options.dart';
import 'package:projectapp/screen/login.dart';
import 'package:projectapp/screen/nabbar.dart';
import 'package:projectapp/sent_using_bank/submited_slip.dart';
import 'package:projectapp/sent_using_bank/tranfer_using_bank.dart';
import 'package:projectapp/sent_using_contact_number/contact_to_tranfer.dart';
import 'package:projectapp/sent_using_contact_number/tranfer_to_friend.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
