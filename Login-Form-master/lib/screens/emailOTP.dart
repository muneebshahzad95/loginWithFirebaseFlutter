import 'package:flutter/material.dart';
import 'package:loginform/widgets/textwidget.dart';
import 'package:pinput/pinput.dart';

class EmailOTP extends StatefulWidget {
  const EmailOTP({Key? key}) : super(key: key);

  @override
  State<EmailOTP> createState() => _EmailOTPState();
}

class _EmailOTPState extends State<EmailOTP> {
  final _formKey1 = GlobalKey<FormState>();
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
                        "assets/icons/tsicon.png", color: Colors.pink[300],)),
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
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Pinput(
                    length: 6,
                    //    controller: _pinPutController,

                    onChanged :(pin)async{
                      print(pin);
                      if(pin.length == 6){
                      }
                    },
                    //   submittedPinTheme: pinPutDecoration,
                  ),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: GestureDetector(
                    onTap: () {
                      //   Navigator.push(context, PageTransition(child: PhoneOTP(), type: PageTransitionType.leftToRight));
                      //  resetPassword();
                    },
                    child: Card(
                      elevation: 3,
                      shadowColor: Colors.pink,
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.pinkAccent, Colors.orangeAccent]),
                        ),
                        child: TextWidget(
                            "Reset Password", Colors.white, 16.0, FontWeight
                            .bold),
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
