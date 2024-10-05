import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  late String firstName;
  late String lastName;
  late String emailAddress;
  late String password;

  GlobalKey<FormState> signUpFormKey = GlobalKey();
  GlobalKey<FormState> signInFormKey = GlobalKey();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();

  bool? obscurePasswordTextValue = true;

  // Sign-Up Logic
  Future<void> signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      await addUserProfile();
      await verifyEmail();
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      handleSignUpException(e);
    } catch (e) {
      emit(SignUpFailureState(errmsg: e.toString()));
    }
  }

  void handleSignUpException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(SignUpFailureState(errmsg: 'The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      emit(SignUpFailureState(errmsg: 'The account already exists for that email.'));
    } else if (e.code == 'invalid-email') {
      emit(SignUpFailureState(errmsg: 'The Email is Invalid.'));
    } else {
      emit(SignUpFailureState(errmsg: e.code));
    }
  }

  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  // Sign-In Logic
  Future<void> signInWithEmailAndPassword() async {
    try {
      emit(SignInLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailureState(errMsg: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailureState(errMsg: 'Wrong password provided for that user.'));
      } else {
        emit(SignInFailureState(errMsg: 'Check your Email and Password.'));
      }
    } catch (e) {
      emit(SignInFailureState(errMsg: e.toString()));
    }
  }

  Future<void> resetPasswordWithLink() async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordFailureState(errMsg: e.toString()));
    }
  }

  // Add User Profile to Firestore
  Future<void> addUserProfile() async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    await users.add({
      "first_name": firstName,
      "last_name": lastName,
      "email": emailAddress,
      "password": password,
    });
  }

  // Obscure Password Text
  void obscurePasswordText() {
    obscurePasswordTextValue = !obscurePasswordTextValue!;
    emit(ObscurePasswordTextUpdateState());
  }

  // Google Sign-In Logic
  Future<void> signInWithGoogle() async {
    try {
      emit(GoogleSignInLoadingState());
      final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

        emit(GoogleSignInSuccessState(userCredential.user!));
      } else {
        emit(GoogleSignInFailureState(error: 'Google Sign-In aborted by user.'));
      }
    } catch (error) {
      emit(GoogleSignInFailureState(error: error.toString()));
    }
  }
  // Facebook Sign-In Logic

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Facebook Sign-In Logic
  Future<void> signInWithFacebook() async {
    emit(FacebookSignInLoadingState()); // Emit loading state

    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Check if the login was successful
      if (loginResult.status == LoginStatus.success) {
        // Create a credential from the access token
        final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

        // Once signed in, return the UserCredential
        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

        emit(FacebookSignInSuccessState(userCredential as User)); // Emit success state with UserCredential
      } else {
        emit(FacebookSignInFailureState( error: "Login failed: ${loginResult.status}")); // Emit failure state
      }
    } catch (error) {
      emit(FacebookSignInFailureState(error:error.toString())); // Emit failure state with error message
    }
  }
  Future<void> addUserToFirestore(User? user) async {
  if (user != null) {
  final userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);
  final docSnapshot = await userDoc.get();

  // Only add user if they do not exist in Firestore yet
  if (!docSnapshot.exists) {
  await userDoc.set({
  'uid': user.uid,
  'name': user.displayName ?? 'No Name',
  'email': user.email ?? 'No Email',
  'role': 'user', // Default role
  });
  }
  }
  }
  }
