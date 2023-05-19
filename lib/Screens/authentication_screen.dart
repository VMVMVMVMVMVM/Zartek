import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zartek_foodie/widgets/mobile_verification.dart';

import '../Provider/Google_signIn.dart';
import 'home_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  late Size mq;
  bool _isAnimate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isAnimate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Welcome to Zartek Foodie',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            top: mq.height * .10,
            right: _isAnimate ? mq.width * .25 : -mq.width * .5,
            width: mq.width * .5,
            child: Image.asset('images/foodie.png'),
            duration: Duration(seconds: 1),
          ),
          Positioned(
            bottom: mq.height * .25,
            left: mq.width * .05,
            width: mq.width * .9,
            height: mq.height * .17,
            child: Column(
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      shape: StadiumBorder(),
                      backgroundColor: Colors.lightBlue),
                  onPressed: () async {
                    final provider = await Provider.of<GoogleSignInProvider>(
                        context,
                        listen: false);
                    provider.googleLogin();

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  icon: Image.asset(
                    'images/google.png',
                    height: mq.height * .03,
                  ),
                  label: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'LogIn with ', style: TextStyle(fontSize: 16)),
                      TextSpan(
                          text: 'Google',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16)),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      shape: StadiumBorder(),
                      backgroundColor: Colors.lightBlue),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MobileVerification()));
                  },
                  icon: Image.asset(
                    'images/telephone.png',
                    height: mq.height * .03,
                  ),
                  label: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'LogIn with ', style: TextStyle(fontSize: 16)),
                      TextSpan(
                          text: 'Phone',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16)),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
