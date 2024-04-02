import 'package:autobucket/features/auth/views/signInView.dart';
import 'package:autobucket/features/home/view.dart';
import 'package:autobucket/features/auth/views/signUpView.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auto Bucket',
      home: SignUpView(),
      routes: {
        SignUpView.route: (context) => SignUpView(),
        SignInView.route: (context) => SignInView(),
        HomeView.route: (context) => HomeView(),
      },
    );
  }
}
