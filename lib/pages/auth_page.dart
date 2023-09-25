import 'package:flutter_application_1/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/home.dart';

import 'package:flutter_application_1/pages/screens/chat_page.dart';
import 'package:flutter_application_1/pages/register_page.dart';

/// Page to redirect users to the appropriate page depending on the initial auth state
class AuthPage extends StatefulWidget {
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
      Navigator.of(context)
          .pushAndRemoveUntil(LoginPage.route(), (route) => false);
    } else {
      Navigator.of(context)
          .pushAndRemoveUntil(Home.route(), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: preloader);
  }
}




