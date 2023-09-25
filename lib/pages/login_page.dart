import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/screens/chat_page.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_textfield.dart';
import 'package:flutter_application_1/components/square_tile.dart';
import 'package:flutter_application_1/pages/register_page.dart';
import 'package:flutter_application_1/pages/auth_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const LoginPage());
  }

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(color: Color.fromRGBO(64, 212, 0, 1),),
        );
      },
    );
    setState(() {
      _isLoading = true;
    });
    try {
      await supabase.auth.signInWithPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AuthPage()), 
          (Route <dynamic> route)=>false
      );
    } on AuthException catch (error) {
      Navigator.pop(context);
      context.showErrorSnackBar(message: error.message);
    } catch (_) {
      Navigator.pop(context);
      context.showErrorSnackBar(message: unexpectedErrorMessage);
    }
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                  const SizedBox(height:50),
                  Image.asset("assets/Images/Image1.jpg", height: 120),
                  const SizedBox(height: 10.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text(
                          "Bienvenue dans ",
                          style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "SmartFamAPP",
                          style: TextStyle(
                          fontFamily: 'Poppins-Black',
                          fontSize: 16,
                          color: Color.fromRGBO(64, 212, 0, 1)),
                          textAlign: TextAlign.center,
                        )
                    ]
                  ),
                const SizedBox(height: 30,),
                // email textfield
                MyTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  obscureText: false,
                  icon: Icons.account_circle,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: _passwordController,
                  hintText: 'Password',
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
                  onTap: _isLoading ? null : _signIn,
                  text: 'Connexion',
                ),

                const SizedBox(height: 30),

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
                          "Se connecter avec",
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

                const SizedBox(height: 20),

                // google + apple sign in buttons
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(imagePath: "assets/Images/search.png"),
                  ],
                ),

                const SizedBox(height: 15),

                // not a member? register now
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Pas encore inscrit ?",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 5,),
                      TextButton(
                        child: const Text("Inscrivez-vous maintenant",
                                    style: TextStyle(
                                    color: Color.fromRGBO(64, 212, 0, 1), 
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                        )), 
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: ((context) => RegisterPage())));
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
