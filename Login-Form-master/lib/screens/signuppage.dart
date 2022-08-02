import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginform/classes/utils_snackbar.dart';
import 'package:loginform/models/newusermodels.dart';
import 'package:loginform/screens/PhoneOTP.dart';
import 'package:loginform/widgets/textwidget.dart';
import 'package:page_transition/page_transition.dart';

String? verificationId;
NewUserModel newUserModel = NewUserModel();

class SignUpScr extends StatefulWidget {
  // final VoidCallback onClickSignUp;

  const SignUpScr({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpScr> createState() => _SignUpScrState();
}

class _SignUpScrState extends State<SignUpScr> {
  User? user;

  EmailAuth emailAuth = EmailAuth(sessionName: "OTP");
  final FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController newEmailController = TextEditingController();
  TextEditingController newUsernameController = TextEditingController();
  TextEditingController newPhoneController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController newPassConfirmController = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();
  bool waiting = true;

  @override
  void dispose() {
    newEmailController.dispose();
    newPassController.dispose();
    super.dispose();
  }

  String? smsCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey1,
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
                      TextWidget(" Create your Account", Colors.black, 20.0,
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
                          controller: newUsernameController,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Username"),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'username';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
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
                          controller: newEmailController,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Email"),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Your email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
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
                          controller: newPhoneController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Phone Number"),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Your Phone Number';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
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
                          controller: newPassController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Password"),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
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
                          controller: newPassConfirmController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Confirm Password"),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: GestureDetector(
                    onTap: () async {
                      newUserModel.userName = newUsernameController.text.trim();
                      newUserModel.userEmail = newEmailController.text.trim();
                      newUserModel.userPhone = newPhoneController.text.trim();
                      newUserModel.userPassword = newPassController.text.trim();
                      verifyPhone();

                      /*sendOTP();*/
                      Navigator.push(
                          context,
                          PageTransition(
                              child: PhoneOTP(verificationId),
                              type: PageTransitionType.rightToLeft));
                    },
                    //  onTap: signUp,
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
                        /*decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.0),
                        ),*/
                        child: TextWidget(
                            "Sign Up", Colors.white, 16.0, FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextWidget(
                    "-Or Sign Up with-", Colors.black, 19.0, FontWeight.normal),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: Image.asset("assets/icons/google.png"),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        child: Image.asset("assets/icons/fb.png"),
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
                        child: TextWidget("Already Have an Account?",
                            Colors.grey, 13.0, FontWeight.normal)),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: TextWidget("Log in", Colors.pinkAccent[200],
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

  Future signUp() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: newEmailController.text.trim(),
              password: newPassController.text.trim())
          .whenComplete(() => waiting == true);
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
    //navigatorKey.currentState!.popUntil((route))=>
  }

  void sendOTP() async {
    var res = await emailAuth.sendOtp(
        recipientMail: newEmailController.text.trim(), otpLength: 6);
    if (res) {
      print("OTP send");
    } else {
      print("we could not semt OTP");
    }
  }

  verifyPhone() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {};
    final PhoneCodeSent smsCodeSent = (String verId, [int? forceCodeResent]) {
      setState(() {
        verificationId = verId;
      });
      print("===================>verifiactionID= $verificationId");
    };
    final PhoneVerificationCompleted _verifiedSuccess =
        (AuthCredential auth) {};
    final PhoneVerificationFailed _verifyFailed = (FirebaseAuthException e) {
      print("firebase exception: $e");
    };
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: newUserModel.userPhone.toString(),
        timeout: const Duration(seconds: 30),
        verificationCompleted: _verifiedSuccess,
        verificationFailed: _verifyFailed,
        codeSent: smsCodeSent,
        codeAutoRetrievalTimeout: autoRetrieve,
      );
    } catch (e) {
      print('failed to verify your number');
    }
  }
}
