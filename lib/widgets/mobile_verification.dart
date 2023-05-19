import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zartek_foodie/Screens/home_screen.dart';

class MobileVerification extends StatefulWidget {
  const MobileVerification({Key? key}) : super(key: key);

  @override
  State<MobileVerification> createState() => _MobileVerificationState();
}

class _MobileVerificationState extends State<MobileVerification> {
  final mobileController = TextEditingController();
  final otpController = TextEditingController();

  var ourOtp = "";
  var verifyId = "";

   Future sendOtp({phone}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential) async {
          await FirebaseAuth.instance.signInWithCredential(PhoneAuthCredential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.toString());
        },
        codeSent: (String? verificationId, int? resendToken) {
          verifyId = verificationId.toString();
        },
        codeAutoRetrievalTimeout: (value) {});
  }

   Future LogIn() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verifyId,
      smsCode: otpController.text,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile Verification'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: mobileController,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Phone Number',
                  hintText: ' eg:9876543210',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: otpController,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'OTP',
                  hintText: '* * * * * *',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: (){
                  sendOtp(phone: mobileController.text);
                },
                child: Text('Send Otp'),
              ),
              ElevatedButton(
                onPressed: () {
                  LogIn();
                },
                child: Text('LogIn'),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
