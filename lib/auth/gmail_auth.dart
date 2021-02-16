import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;
GoogleSignIn _googleSignIn = GoogleSignIn();
bool isUserSignedIn = false;

Future<bool> googleSignIn() async {
  GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();

  if (googleSignInAccount != null) {
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credentials = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    // ignore: unused_local_variable
    UserCredential result = await auth.signInWithCredential(credentials);

    User user = auth.currentUser;
    print(user.uid);
  }
  return Future.value(true);
}
