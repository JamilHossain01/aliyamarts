import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register New User
  Future<String> registerNewUser(
      String email, String password, String name) async {
    String res = 'Something went wrong'; // Default error message
    try {
      // Register the user with Firebase Auth
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store additional user data in Firestore
      await _firestore.collection('buyers').doc(userCredential.user!.uid).set({
        'fullName': name,
        'email': email,
        'profileImage': "", // Default empty profile image
        'uid': userCredential.user!.uid,
        'pincode': '',
        'locality': '',
        'city': '',
        'state': '',
      });

      res = 'success'; // Success response
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        res = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        res = 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        res = 'The email address is badly formatted.';
      } else {
        res = 'Registration error: ${e.message}';
      }
    } catch (e) {
      res = 'An error occurred during registration. Please try again.';
    }
    return res;
  }

  // Login User
  Future<String> loginUser(String email, String password) async {
    String res = 'Something went wrong'; // Default error message

    // Validate input
    if (email.isEmpty) {
      return 'Please enter your email address.';
    }
    if (!email.contains('@')) {
      return 'Please enter a valid email address.';
    }
    if (password.isEmpty) {
      return 'Please enter your password.';
    }

    try {
      // Attempt to sign in the user
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      res = 'success'; // Successful login
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          res = 'No user found for that email.';
          break;
        case 'wrong-password':
          res = 'Incorrect password provided.';
          break;
        case 'invalid-email':
          res = 'The email address is badly formatted.';
          break;
        case 'user-disabled':
          res = 'This user account has been disabled.';
          break;
        default:
          res = 'Login error: ${e.message}';
      }
    } catch (e) {
      res = 'An error occurred during login. Please try again.';
    }

    return res;
  }
}
