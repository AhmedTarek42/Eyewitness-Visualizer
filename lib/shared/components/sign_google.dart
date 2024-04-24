import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();
Future<void> signInWithGoogle() async {

  GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
  GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount!.authentication;
  AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);
  UserCredential authResult = await _auth.signInWithCredential(authCredential);
  User user = await _auth.currentUser!;
  print('user email = ${user.email}');
}

Future<void> signOut() async {
  await _googleSignIn.signOut();
  print('sign out');
}