import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_application_1/pages/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    // TODO: Replace credentials with your own
    url: 'https://tjmzbwuorwogbnjmjecs.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRqbXpid3VvcndvZ2Juam1qZWNzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU1NjIzNTMsImV4cCI6MjAxMTEzODM1M30.ehKRAFpYvsQOHrvW9pklEMl8afNCvDUyRoKsatAHDVI',
  );
  runApp(const MyApp());
}

//final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Chat App',
      theme: appTheme,
      home: const SplashPage(),
    );
  }
}
