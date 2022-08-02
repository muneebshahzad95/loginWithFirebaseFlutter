import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginform/screens/signuppage.dart';
import 'package:loginform/widgets/textwidget.dart';
import 'package:pinput/pinput.dart';

class PhoneOTP extends StatefulWidget {
  String? verificationId;

  PhoneOTP(this.verificationId, {Key? key}) : super(key: key);

  @override
  State<PhoneOTP> createState() => _PhoneOTPState();
}

class _PhoneOTPState extends State<PhoneOTP> {
  /*String? verificationId = "0";*/
  String? smsCode;
  final _formKey1 = GlobalKey<FormState>();
  final TextEditingController _pinPutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Row(
                    children: [
                      TextWidget("OTP", Colors.black, 20.0, FontWeight.bold),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Pinput(
                    length: 6,
                    controller: _pinPutController,

                    onChanged: (pin) async {
                      print(pin);
                      if (pin.length == 6) {}
                    },
                    //   submittedPinTheme: pinPutDecoration,
                  ),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: GestureDetector(
                    onTap: () async {
                      newUserModel.userName;
                      smsCode = '123456';

                      // Create a PhoneAuthCredential with the code
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: verificationId.toString(),
                              smsCode: _pinPutController.text.trim());

                      try {
                        await FirebaseAuth.instance
                            .signInWithCredential(credential);
                        addUserDetail();
                        print("successful submited");
                      } catch (e) {
                        print("incorrect OTP");
                      }
                      //   Navigator.push(context, PageTransition(child: PhoneOTP(), type: PageTransitionType.leftToRight));
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
                        child: TextWidget(
                            "Confirm OTP", Colors.white, 16.0, FontWeight.bold),
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

  Future addUserDetail() async {
    await FirebaseFirestore.instance.collection('users').add({
      'userName': newUserModel.userName,
      'newEmail': newUserModel.userEmail,
      'newPhone': newUserModel.userPhone,
      'newPassword': newUserModel.userPassword,
    });
  }
}
