import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/screens/chat_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_textfield.dart';
import 'package:flutter_application_1/components/square_tile.dart';
import 'package:flutter_application_1/pages/auth_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => RegisterPage(),
    );
  }

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final bool _isLoading = false;


  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();
  final _usernameController = TextEditingController();

  Future<void> _signUp() async {
    if (_passwordController.text == _repasswordController.text) {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(color: Color.fromRGBO(64, 212, 0, 1),),
          );
        },
      );
      final email = _emailController.text;
      final password = _passwordController.text;
      final repassword = _repasswordController.text;
      final username = _usernameController.text;
      try {
        await supabase.auth.signUp(
            email: email, password: password, data: {'username': username});
        _emailController.clear();
        _passwordController.clear();
        _repasswordController.clear();
        _usernameController.clear();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AuthPage()), 
          (Route <dynamic> route)=>false
        );
      } on AuthException catch (error) {
        context.showErrorSnackBar(message: error.message);
      } catch (error) {
        context.showErrorSnackBar(message: unexpectedErrorMessage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              width: w,
              height: h,
              decoration: const BoxDecoration(color: Colors.transparent),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                  Image.asset("assets/Images/Trace.png", height: 100),
                  const SizedBox(height:20),
                  Image.asset("assets/Images/Image1.jpg", height: 100),
                  const SizedBox(height: 8.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text(
                          "Inscrivez-vous dans ",
                          style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "La communauté",
                          style: TextStyle(
                          fontFamily: 'Poppins-Black',
                          fontSize: 15,
                          color: Color.fromRGBO(64, 212, 0, 1)),
                          textAlign: TextAlign.center,
                        )
                    ]
                  ),
                const SizedBox(height: 22,),
                // email textfield
                MyTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  obscureText: false,
                  icon: Icons.account_circle,
                ),
                const SizedBox(height: 7),

                MyTextField(
                  controller: _usernameController,
                  hintText: "Nom d'utilisateur",
                  obscureText: false,
                  icon: Icons.account_circle,
                ),

                const SizedBox(height: 7),

                // password textfield
                MyTextField(
                  controller: _passwordController,
                  hintText: 'Mot de passe',
                  obscureText: true,
                  icon: Icons.lock,
                ),
                                
                const SizedBox(height: 7),

                // password textfield
                MyTextField(
                  controller: _repasswordController,
                  hintText: 'Confirmer le mot de passe',
                  obscureText: true,
                  icon: Icons.lock,
                ),

                const SizedBox(height: 0),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text("Mot de passe oublié ?" ,style: TextStyle(color: Color.fromRGBO(64, 212, 0, 1), fontSize: 15)), 
                        onPressed:() {
                          
                        },
                      ),
                    ]
                  ),
                ),

                const SizedBox(height: 0),

                // sign in button
                MyButton(
                  onTap: _isLoading ? null : _signUp,
                  text: 'Inscription',
                ),

                const SizedBox(height: 40),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Se'inscrire avec",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // not a member? register now
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Déjà inscrit ?",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 5,),
                      TextButton(
                        child: const Text("Connectez-vous maintenant",
                                    style: TextStyle(
                                    color: Color.fromRGBO(64, 212, 0, 1), 
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                        )), 
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      )
    );
  }
}


