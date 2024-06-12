import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../repository/authentication_repository/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  
  ///TextField controllers to get data from Textfields
  final email = TextEditingController();
  final password = TextEditingController();
  
  //Call this Function from Design & it will do the rest
  Future<void> loginUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password);
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }
}