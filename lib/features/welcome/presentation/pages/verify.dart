import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class VerifyPhoneNumberPage extends StatefulWidget {
  @override
  _VerifyPhoneNumberPageState createState() => _VerifyPhoneNumberPageState();
}

class _VerifyPhoneNumberPageState extends State<VerifyPhoneNumberPage> {

  final TextEditingController _verificationCodeInputController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration pinPutDecoration = BoxDecoration(
    color: Colors.white30,
    borderRadius: BorderRadius.circular(5),
  );

  Widget _bodyBuilder() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(50),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(241, 39, 17, 1),
                  Color.fromRGBO(245, 175, 25, 1)
                ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text("Verify Phonenumber", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
            ),
            Container(
              width: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
//              color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: PinPut(
                fieldsCount: 5,
                textStyle: TextStyle(fontSize: 25, color: Colors.black),
                eachFieldWidth: 45,
                eachFieldHeight: 55,
                onSubmit: (String pin) => (){},
                focusNode: _pinPutFocusNode,
                controller: _verificationCodeInputController,
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration.copyWith(
                    color: Colors.white,
                    border: Border.all(
                      width: 2,
                      color: Color.fromRGBO(160, 215, 220, 1),
                    )),
                followingFieldDecoration: pinPutDecoration,
                pinAnimationType: PinAnimationType.scale,
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 400,
                    child: FlatButton(
                      color: Colors.white,
                      onPressed: (){
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Text("Next", style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20, fontWeight: FontWeight.bold),),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.white)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: RichText(
                      text: TextSpan(
                          text: 'By signing up you agree to our ',
                          style: TextStyle(
                              color: Colors.white, fontSize: 15),
                          children: <TextSpan>[
                            TextSpan(text: 'Terms and Conditions',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold, decoration: TextDecoration.underline,),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // navigate to desired screen
                                  }
                            )
                          ]
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyBuilder(),
    );
  }
}
