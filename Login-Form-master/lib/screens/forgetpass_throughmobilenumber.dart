import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginform/screens/PhoneOTP.dart';
import 'package:loginform/screens/loginpage.dart';
import 'package:loginform/screens/signuppage.dart';
import 'package:loginform/widgets/textwidget.dart';
import 'package:page_transition/page_transition.dart';

class ForgetPass_MobileNum extends StatefulWidget {
  const ForgetPass_MobileNum({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgetPass_MobileNum> createState() => _ForgetPass_MobileNumState();
}

class _ForgetPass_MobileNumState extends State<ForgetPass_MobileNum> {
  // TextEditingController fUserController = TextEditingController();
  // TextEditingController otpUserController = TextEditingController();

  EmailAuth emailAuth = EmailAuth(sessionName: "OTP");
  final _formKey1 = GlobalKey<FormState>();
  bool sendOtpTextField = false;

  @override
  void dispose() {
    //  fUserController.dispose();

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
                          //   controller: _controller,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                    height: 30,
                                    width: 50,
                                    child: const Center(
                                        child:  Text('(+92)',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)))),
                              ),
                              suffixIcon: const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )),
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
                  child: GestureDetector(
                    onTap: () {
                      //      Navigator.push(context, PageTransition(child: PhoneOTP(""), type: PageTransitionType.leftToRight));
                      //  resetPassword();
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
                        child: TextWidget("Reset Password", Colors.white, 16.0,
                            FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget("Not receive the code?", Colors.black, 14.0,
                        FontWeight.normal),
                    TextWidget("resend it", Colors.pink, 14.0, FontWeight.bold),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
