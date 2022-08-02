import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginform/classes/utils_snackbar.dart';
import 'package:loginform/screens/forgetpass_throughmobilenumber.dart';
import 'package:loginform/screens/loginpage.dart';
import 'package:loginform/screens/signuppage.dart';
import 'package:loginform/widgets/textwidget.dart';
import 'package:page_transition/page_transition.dart';

class ForgetPasswordScr extends StatefulWidget {
  const ForgetPasswordScr({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgetPasswordScr> createState() => _ForgetPasswordScrState();
}

class _ForgetPasswordScrState extends State<ForgetPasswordScr> {
  TextEditingController fUserController = TextEditingController();
  TextEditingController otpUserController = TextEditingController();

  EmailAuth emailAuth = EmailAuth(sessionName: "OTP");
  final _formKey1 = GlobalKey<FormState>();
  bool sendOtpTextField = false;

  @override
  void dispose() {
    fUserController.dispose();

    super.dispose();
  }

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
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Center(
                      child: Image.asset("assets/images/dottedbackground.png")),
                ),
                Flexible(
                  flex: 1,
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
                      TextWidget(" Forget Password", Colors.black, 20.0,
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
                          controller: fUserController,
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    sendOtpTextField = true;
                                  });
                                  sendOTP();
                                  print("otp tap");
                                },
                                child: Container(
                                    height: 50,
                                    width: 80,
                                    child: const Center(
                                      child:  Text(
                                        "OTP Send",
                                      ),
                                    )),
                              ),
                              border: InputBorder.none,
                              hintText: "Enter your Email address"),
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
                sendOtpTextField == true
                    ? Flexible(
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
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 5),
                              child: TextFormField(
                                controller: otpUserController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "OTP Code?"),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'OTP';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                const SizedBox(
                  height: 5,
                ),
                sendOtpTextField == true
                    ? Flexible(
                        flex: 2,
                        fit: FlexFit.loose,
                        child: GestureDetector(
                          onTap: () {
                            verifyOTP();
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
                                    colors: [
                                      Colors.pinkAccent,
                                      Colors.orangeAccent
                                    ]),
                              ),
                              child: TextWidget("Confirm OTP", Colors.white,
                                  16.0, FontWeight.bold),
                            ),
                          ),
                        ))
                    : Flexible(
                        flex: 2,
                        fit: FlexFit.loose,
                        child: GestureDetector(
                          onTap: () {
                            ///--- direct goto the link of reset password
                            resetPassword();
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
                                    colors: [
                                      Colors.pinkAccent,
                                      Colors.orangeAccent
                                    ]),
                              ),
                              child: TextWidget("Reset Password", Colors.white,
                                  16.0, FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget("Not receive the code?", Colors.black, 14.0,
                        FontWeight.normal),
                    TextWidget("resend it", Colors.pink, 14.0, FontWeight.bold),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget("Use another way?", Colors.black, 14.0,
                        FontWeight.normal),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: const ForgetPass_MobileNum(),
                                  type: PageTransitionType.leftToRight));
                        },
                        child: TextWidget("Phone Number", Colors.pink, 14.0,
                            FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendOTP() async {
    var res = await emailAuth.sendOtp(
        recipientMail: fUserController.text.trim(), otpLength: 6);
    if (res) {
      print("OTP send");
    } else {
      print("we could not semt OTP");
    }
  }

  void verifyOTP() {
    var res = emailAuth.validateOtp(
        recipientMail: fUserController.text.trim(),
        userOtp: otpUserController.text.trim());
    if (res) {
      print("OTP verified");
    } else {
      print("invalid OTP");
    }
  }

  Future resetPassword() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: fUserController.text.trim());
      Utils.showSnackBar('Password Reset Email Sent!');

      Navigator.popUntil(context, (route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
      Navigator.pop(context);
    }
  }
}
