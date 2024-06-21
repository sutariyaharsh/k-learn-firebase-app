import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_flutter_app/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:login_flutter_app/src/features/core/screens/dashboard/dashboard.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Varibales
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  //Will be load when app lunches this func sill be called and set the firebase state
  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  //Setting initial screen onLOAD
  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => const WelcomeScreen()) : Get.offAll(() => const Dashboard());
  }

  /// Phone Authentication
  loginWithPhoneNo(String phoneNumber) async {
    try {
      await _auth.signInWithPhoneNumber(phoneNumber);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-phone-number') {
        Get.snackbar("Error", "Invalid Phone No");
      }
    } catch (_) {
      Get.snackbar("Error", "Somthing went wrong.");
    }
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The provided phone number is not valid.');
        } else {
          Get.snackbar('Error', 'Somthing went wrong. Try again.');
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<String?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => const Dashboard()) : Get.to(() => WelcomeScreen());
      log("${userCredential.user!.uid}", name: "Firebase userID");
    } on FirebaseAuthException catch (e) {
      // final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      // print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      // return ex.message;
      return e.toString();
    } catch (e) {
      // const ex = SignUpWithEmailAndPasswordFailure();
      // print('EXCEPTION - ${ex.message}');
      return e.toString();
    }
    return null;
  }

  Future<String?> loginUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // final ex = LogInWithEmailAndPasswordFailure.fromCode(e.code);
      return e.toString();
    } catch (e) {
      // final ex = LogInWithEmailAndPasswordFailure();
      return e.toString();
    }
    return null;
  }

  Future<void> logout() async => await _auth.signOut();
}
