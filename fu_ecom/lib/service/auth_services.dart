import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Google sign-in
  Future<UserCredential> signInWithGoogle() async {
    // Start the sign-in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    if (gUser == null) {
      throw FirebaseAuthException(
        message: "Google sign-in aborted",
        code: "ERROR_ABORTED_BY_USER",
      );
    }
    // Obtain authentication details from the request
    final GoogleSignInAuthentication gAuth = await gUser.authentication;
    // Create a new credential for the user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    // Sign in to Firebase with the credentials
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
