import 'package:firebase_auth/firebase_auth.dart';
import 'package:sponsorHumanity/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'common_functions.dart';

class AuthService {
  //this will give us access to firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

//crete user obj based on firebaseuser
  AppUser _userFromFirebaseUser(User user) {
    return user != null
        ? AppUser(
            uid: user.uid,
            uName: user.displayName,
            uEmail: user.email,
            uPhone: user.phoneNumber)
        : null;
  }

// auth change user stream
  Stream<AppUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

//sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign in with email
  Future signInWithEmail(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User thisUser = credential.user;
      return _userFromFirebaseUser(thisUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//register with email,password,name,phone and password
  Future registerWithEmail(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User thisUser = credential.user; //user created
      tmpPrint( "createUserWithEmailAndPassword() called ... returning..." );
    
      return _userFromFirebaseUser(thisUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with google
  Future signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;

      if (googleAuth.idToken != null) {
        final credential =
            await _auth.signInWithCredential(GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        ));

        User thisUser = credential.user;
        assert(thisUser.email != null);
        assert(thisUser.displayName != null);
        assert(!thisUser.isAnonymous);

        return _userFromFirebaseUser(thisUser);
      } else {
        throw FirebaseAuthException(
          code: 'ERROR_MISSING_GOOGLE_ID_TOKEN',
          message: 'Missing Google ID Token',
        );
      }
    } else {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

  //sign in with  facebook
  Future signInWithFacebook() async {

    // tmpPrint( "FB login called!");
    final fb = FacebookLogin();
    if ( fb == null )
    {
      tmpPrint( 'auth.dart: NULL!!' );
    }
    tmpPrint( 'auth.dart: after FB login()' );
    final response = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    tmpPrint( 'auth.dart: Response from FB login: $response.status' );

    switch (response.status) {
      case FacebookLoginStatus.Success:
        final accessToken = response.accessToken;
        final credential = await _auth.signInWithCredential(
          FacebookAuthProvider.credential(accessToken.token),
        );
        User thisUser = credential.user;
        assert(thisUser.email != null);
        assert(thisUser.displayName != null);
        assert(!thisUser.isAnonymous);
        tmpPrint( 'auth.dart: Response from FB login user= $thisUser' );
        return _userFromFirebaseUser( thisUser );

      case FacebookLoginStatus.Cancel:
        throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user',
        );

      case FacebookLoginStatus.Error:
        throw FirebaseAuthException(
          code: 'ERROR_FACEBOOK_LOGIN_FAILED',
          message: response.error.developerMessage,
        );
      default:
        tmpPrint( 'auth.dart: ** DEFAULT ** condition! Response from FB login: $response.status' );
        throw UnimplementedError();
    }
  }

//sign out
  Future signOut() async {
   try {
      final googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      final facebookLogin = FacebookLogin();
      await facebookLogin.logOut();
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
