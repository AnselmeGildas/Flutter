// ignore_for_file: prefer_const_constructors

import 'package:flutter_application_1/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/home.dart';

import 'package:flutter_application_1/pages/screens/chat_page.dart';
import 'package:flutter_application_1/pages/register_page.dart';

/// Page to redirect users to the appropriate page depending on the initial auth state
class AuthPage extends StatefulWidget {
  // ignore: use_super_parameters
  const AuthPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const AuthPage(),
    );
  }

  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    // await for for the widget to mount
    await Future.delayed(Duration.zero);

    final session = supabase.auth.currentSession;
    if (session == null) {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()), 
          (Route <dynamic> route)=>false
        );
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Home()), 
        (Route <dynamic> route)=>false
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: preloader);
  }
}




