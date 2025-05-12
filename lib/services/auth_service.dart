import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Google Sign-In
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await _googleSignIn.signIn();

      if (gUser == null) {
        throw FirebaseAuthException(message: 'Google sign-in was canceled.', code: '');
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user; // Returning the Firebase User
    } catch (e) {
      print("Error during Google sign-in: $e");
      throw FirebaseAuthException(message: 'Google sign-in failed: $e', code: '');
    }
  }

  // Email/Password Sign-In
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Error during email/password sign-in: $e");
      throw FirebaseAuthException(message: 'Email/Password sign-in failed: $e', code: '');
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    // Add other sign-out logic for other providers if needed
  }

  // Get current user
  User? get currentUser => _auth.currentUser;
}
