import 'package:firebase_auth/firebase_auth.dart';
import 'package:sponsorHumanity/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

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
  //  Future signInWithFacebook() async {

  //   final fb = FacebookLogin();
  //   if ( fb == null )
  //   {}

  //   final FacebookLoginResult response = await fb.logIn(permissions: [
  //     FacebookPermission.publicProfile,
  //     FacebookPermission.email,
  //   ]);

  //   switch (response.status) {
  //     case FacebookLoginStatus.Success:
  //       final accessToken = response.accessToken;
  //       final userCredential = await _firebaseAuth.signInWithCredential(
  //         FacebookAuthProvider.credential(accessToken.token),
  //       );
  //       return userCredential.user;
  //     case FacebookLoginStatus.Cancel:
  //       throw FirebaseAuthException(
  //         code: 'ERROR_ABORTED_BY_USER',
  //         message: 'Sign in aborted by user',
  //       );
  //     case FacebookLoginStatus.Error:
  //       throw FirebaseAuthException(
  //         code: 'ERROR_FACEBOOK_LOGIN_FAILED',
  //         message: response.error.developerMessage,
  //       );
  //     default:

  //       throw UnimplementedError();
  //   }
  // }

//sign out
  Future signOut() async {
    try {
      final googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();

      await _auth.signOut().then((value) {
        googleSignIn.signOut();
      });
    } catch (e) {
      print(e.toString());

      return null;
    }
  }
}

// import 'package:sponsorHumanity/services/common_functions.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'common_functions.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';

// abstract class AuthBase {
//   User get currentUser;
//   Stream<User> authStateChanges();
//   Future<User> signInAnonymously();
//   Future<User> signInWithGoogle();
//   // Future<User> signInWithFacebook();
//   Future<User> signInWithEmailAndPassword(String email, String password);
//   Future<User> createUserWithEmailAndPassword(String email, String password);
//   Future<void> signOut();
// }

// class Auth implements AuthBase {
//   final _firebaseAuth = FirebaseAuth.instance;

//   @override
//   Stream<User> authStateChanges() => _firebaseAuth.authStateChanges();

//   @override
//   User get currentUser => _firebaseAuth.currentUser;

//   @override
//   Future<User> signInAnonymously() async {
//     final userCredential = await _firebaseAuth.signInAnonymously();
//     return userCredential.user;
//   }

//   @override
//   Future<User> signInWithGoogle() async {
//     tmpPrint("auth.dat: signInWithGoogle() entering");

//     final googleSignIn = GoogleSignIn();
//     final googleUser = await googleSignIn.signIn();

//     tmpPrint("auth.dat: googleUser = $googleUser");
//     if (googleUser != null) {
//       final googleAuth = await googleUser.authentication;
//       if (googleAuth.idToken != null) {
//         final userCredential = await _firebaseAuth
//             .signInWithCredential(GoogleAuthProvider.credential(
//           idToken: googleAuth.idToken,
//           accessToken: googleAuth.accessToken,
//         ));
//         return userCredential.user;
//       } else {
//         throw FirebaseAuthException(
//           code: 'ERROR_MISSING_GOOGLE_ID_TOKEN',
//           message: 'Missing Google ID Token',
//         );
//       }
//     } else {
//       throw FirebaseAuthException(
//         code: 'ERROR_ABORTED_BY_USER',
//         message: 'Sign in aborted by user',
//       );
//     }
//   }

//   @override
//   Future<User> signInWithEmailAndPassword(String email, String password) async {
//     final userCredential = await _firebaseAuth.signInWithCredential(
//       EmailAuthProvider.credential(email: email, password: password),
//     );
//     return userCredential.user;
//   }

//   @override
//   Future<User> createUserWithEmailAndPassword(
//       String email, String password) async {
//     final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     return userCredential.user;
//   }

//   // @override
// Future<User> signInWithFacebook() async {
//   tmpPrint( 'auth.dart: before FB login()' );

//   final fb = FacebookLogin();
//   if ( fb == null )
//   {
//     tmpPrint( 'auth.dart: NULL!!' );
//   }
//   tmpPrint( 'auth.dart: after FB login() currentuser= $currentUser, $fb' );

//   final response = await fb.logIn(permissions: [
//     FacebookPermission.publicProfile,
//     FacebookPermission.email,
//   ]);

//   tmpPrint( 'auth.dart: Response from FB login: $response.status' );

//   switch (response.status) {
//     case FacebookLoginStatus.Success:
//       final accessToken = response.accessToken;
//       final userCredential = await _firebaseAuth.signInWithCredential(
//         FacebookAuthProvider.credential(accessToken.token),
//       );
//       return userCredential.user;
//     case FacebookLoginStatus.Cancel:
//       throw FirebaseAuthException(
//         code: 'ERROR_ABORTED_BY_USER',
//         message: 'Sign in aborted by user',
//       );
//     case FacebookLoginStatus.Error:
//       throw FirebaseAuthException(
//         code: 'ERROR_FACEBOOK_LOGIN_FAILED',
//         message: response.error.developerMessage,
//       );
//     default:
//       tmpPrint( 'auth.dart: Response from FB login: $response.status' );
//       throw UnimplementedError();
//   }
// }

//   @override
//   Future<void> signOut() async {
//     final googleSignIn = GoogleSignIn();
//     await googleSignIn.signOut();

//     final facebookLogin = FacebookLogin();
//     await facebookLogin.logOut();

//     await _firebaseAuth.signOut();
//   }
// }
