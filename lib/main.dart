import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_application_1/pages/auth_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/register_page.dart';
import 'package:flutter_application_1/pages/screens/home_page.dart';
import 'package:flutter_application_1/pages/loadingpage.dart';
import 'package:flutter_application_1/pages/onboarding.dart';

int? initOnbaord=0;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  if (prefs.getInt("initOnbaord") == null) {
    initOnbaord = 0;
  } else {
    initOnbaord = prefs.getInt("initOnbaord");
  }

  await Supabase.initialize(
    // TODO: Replace credentials with your own
    url: 'https://tjmzbwuorwogbnjmjecs.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRqbXpid3VvcndvZ2Juam1qZWNzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU1NjIzNTMsImV4cCI6MjAxMTEzODM1M30.ehKRAFpYvsQOHrvW9pklEMl8afNCvDUyRoKsatAHDVI',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgriXTECH',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      home: const DelayedHomePage(),
      routes: {
        '/OnboardingPage': (context) => const OnboardingPage(),
        '/HomePage': (context) => HomePage(),
        '/LoginPage': (context) => const LoginPage(),
        '/RegisterPage': (context) => const RegisterPage(),
        '/Auth': (context) => const AuthPage(),
      },
    );
  }
}
