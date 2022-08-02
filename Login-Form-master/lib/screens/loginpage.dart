import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:loginform/classes/googlesignin.dart';
import 'package:loginform/classes/utils_snackbar.dart';
import 'package:loginform/screens/forgetpassword.dart';
import 'package:loginform/screens/homescreen.dart';
import 'package:loginform/screens/signuppage.dart';
import 'package:loginform/widgets/textwidget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _email, _password;
  final _formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool obscureText = true;

  // bool isLoggedIn = false;
  //
  // void onLoginStatusChanged(bool isLoggedIn) {
  //   setState(() {
  //     this.isLoggedIn = isLoggedIn;
  //   });
  // }

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();

    super.dispose();
  }

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 4,
                  fit: FlexFit.loose,
                  child: Center(
                      child: Image.asset("assets/images/dottedbackground.png")),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Center(
                      child: Image.asset(
                    "assets/icons/tsicon.png",
                    color: Colors.pink[300],
                  )),
                ),

                const SizedBox(
                  height: 30,
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Row(
                    children: [
                      TextWidget(" Login to your Account", Colors.black, 20.0,
                          FontWeight.bold),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Card(
                    elevation: 3,
                    shadowColor: Colors.pink,
                    child: Container(
                      decoration: BoxDecoration(
                        /* border: Border.all(color: Colors.grey, width: 0.5),*/
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                          controller: userController,
                          onChanged: (value) {
                            setState(() {
                              _email = value.trim();
                            });
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              border: InputBorder.none,
                              hintText: "Emair or Phone Number"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Enter your email address");
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return ("Enter a valid email address");
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Card(
                    elevation: 3,
                    shadowColor: Colors.pink,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                          controller: passController,
                          onChanged: (value) {
                            setState(() {
                              _password = value.trim();
                            });
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              focusColor: Colors.pink,
                              iconColor: Colors.pink,
                              fillColor: Colors.pink,
                              hoverColor: Colors.pink,
                              prefixIconColor: Colors.pink,
                              suffixIconColor: Colors.pink,
                              prefixIcon: const Icon(Icons.lock_clock_outlined),
                              suffixIcon: IconButton(
                                onPressed: toggle,
                                icon: Icon(obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              border: InputBorder.none,
                              hintText: "Password"),
                          validator: (value) {
                            RegExp regex = RegExp(r'^.{6}$');
                            if (value!.isEmpty) {
                              return ("Password is required for login");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Please enter valid password with min 6 characters");
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  child: const ForgetPasswordScr()));
                        },
                        child: TextWidget("Forget Password?", Colors.red, 13.0,
                            FontWeight.normal)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: GestureDetector(
                    onTap: () {
                      if (_email != '' && _password != '') {
                        //       HelperFunctions.saveUserLoggedInSharedPreference(_email);
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: userController.text,
                                password: passController.text)
                            .then((value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen())))
                            .onError((error, stackTrace) =>
                                print("Error ${error.toString()}"));
                      }
                    },
                    child: Card(
                      elevation: 3,
                      shadowColor: Colors.pink,
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.pinkAccent, Colors.orangeAccent]),
                        ),
                        child: TextWidget(
                            "Sign In", Colors.white, 16.0, FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextWidget(
                    "-Or Sign in with-", Colors.black, 19.0, FontWeight.normal),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.googleLogin(context);
                        },
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset("assets/icons/google.png"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          signInWithFacebook();
                        },
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset("assets/icons/fb.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: TextWidget("Don't Have Account?", Colors.grey,
                            13.0, FontWeight.normal)),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const SignUpScr()));
                        },
                        child: TextWidget("Sign Up", Colors.pinkAccent[200],
                            13.0, FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    // showDialog(context: context,
    //     barrierDismissible: false,
    //     builder: (context)=>Center(
    //   child:CircularProgressIndicator(),
    // ) );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userController.text.trim(),
          password: passController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
  }

  void signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance
          .login(permissions: (['email', 'public_profile']));
      final token = result.accessToken!.token;
      print(
          'Facebook token userID : ${result.accessToken!.grantedPermissions}');
      // final graphResponse = await http.get(Uri.parse( 'https://graph.facebook.com/'
      //     'v2.12/me?fields=name,first_name,last_name,email&access_token=${token}'));

      // final profile = jsonDecode(graphResponse.body);
      // print("Profile is equal to $profile");
      try {
        final AuthCredential facebookCredential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookCredential);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } catch (e) {
        final snackBar = SnackBar(
          margin: const EdgeInsets.all(20),
          behavior: SnackBarBehavior.floating,
          content: Text(e.toString()),
          backgroundColor: (Colors.redAccent),
          action: SnackBarAction(
            label: 'dismiss',
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      print("error occurred");
      print(e.toString());
    }
    /*Future<void> fblogout() async {
      await FacebookAuth.signOut();
    }*/
  }
}
