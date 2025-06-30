

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService{

  //FirebaseAuth instance to handle authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //GoogleSignIn instance to handle Google SignIn
  final GoogleSignIn _googleSignIn=GoogleSignIn();



  // Signs in the user with Google and returns the authenticated Firebase [User].
  // Returns `null` if the sign-in process is canceled or fails.
  Future<User?>SignInWithGoogle()async{
    try{

      //Trigger the Google Sign In flow
      final googleUser = await _googleSignIn.signIn();
      //await _googleSignIn.signOut();

      //User canceled the Sign-in
      if(googleUser==null) return null;

      //Retrieve the authentication details from the google account
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;



      //create a new credential using the google authentication details
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      //sign in to firebase with the google credential
      final userCredential = await _auth.signInWithCredential(credential);

      /// Return the authentication user,
      return userCredential.user;

    }catch(e){
      //Print the error and return null if an exception occurs.
      print("Sign-in error: $e");
      return null;
    }
  }

  //sign out the user from both google and firebase
Future<void>signOut()async{

  //Sign out from Google.
    await _googleSignIn.signOut();

    // Sign out from Firebase.
    await _auth.signOut();
    await GoogleSignIn().disconnect();
}

}