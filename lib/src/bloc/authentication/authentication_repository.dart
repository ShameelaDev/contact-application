import 'package:contact_application/src/utilities/logger_utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  loginWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (ex) {
      showErrorMessage(ex.toString());
      return null;
    }
  }

  registerWithEmailPassword(
    String name,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user?.updateDisplayName(name);
      // TODO Update phone number

      return userCredential;
    } catch (ex) {
      showErrorMessage(ex.toString());
      return null;
    }
  }
}
