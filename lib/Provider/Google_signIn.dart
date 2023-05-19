import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount? get user => _user;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    // _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    notifyListeners();
  }
}
// Card(
// elevation: 2,
// child: Padding(
// padding: EdgeInsets.all(8),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// categoryDish.dishImage,
// maxLines: 2,
// style: TextStyle(fontWeight: FontWeight.w700),
// overflow: TextOverflow.ellipsis,
// ),
// SizedBox(
// height: 8,
// ),
// Column(
// children: [
// Row(
// children: [
// Text(categoryDish.dishCurrency as String),
// SizedBox(
// width: 16,
// ),
// Text(categoryDish.dishCalories as String),
// SizedBox(
// width: 2,
// ),
// Container(
// child: Image.network(
// categoryDish.dishImage,
// fit: BoxFit.cover,
// ),
// )
// ],
// ),
// Text(categoryDish.),
// SizedBox(height: 4,),
//
// ],
// )
// ],
// ),
// ),
// );
