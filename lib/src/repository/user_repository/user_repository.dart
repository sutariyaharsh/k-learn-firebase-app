import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter_app/src/features/authentication/models/user_model.dart';
/*
    Todo: Step - 2 [User Repository to perform Database Operations]
*/

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Store user in FireStore
  Future<void> createUser(UserModel user) async {
    await _db.collection("Users").add(user.toJson()).then((docRef) {
      // Save the document ID
      user.id = docRef.id;
      // Optionally, update the user document to include the document ID
      docRef.update({'id': user.id});

      Get.snackbar(
        "Success",
        "Your account has been created.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    }).catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print("ERROR - $error");
    });
  }

  /// Step 2 - Fetch All Users OR User details
  Future<UserModel> getUserDetails(String email) async {
    final snapshot = await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((doc) {
      final user = UserModel.fromSnapshot(doc);
      user.id = doc.id;  // Capture the document ID
      return user;
    }).single;
    return userData;
  }

  Future<List<UserModel>> allUsers() async {
    final snapshot = await _db.collection("Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    if (user.id == null || user.id!.isEmpty) {
      log("Error: Document ID is null or empty", name: "Error");
      return;
    }

    await _db.collection("Users").doc(user.id).update(user.toJson()).catchError((error) {
      log("$error", name: "Error");
    });
  }
}