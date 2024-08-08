import 'package:finance_app/firebase_options.dart';
import 'package:finance_app/screens/sign_up.dart';
import 'package:finance_app/widgets/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/sign_up.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Tracker',
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!);
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}


// https://www.youtube.com/watch?v=9YuKvGElOe8
// Progres :
// https://www.youtube.com/watch?v=9YuKvGElOe8&t=6890s

// https://www.youtube.com/watch?v=9-QFt-cWZV8
// https://www.youtube.com/watch?v=sR01f71Kuag