import 'package:cloud_firestore/cloud_firestore.dart';

/*
    Todo: Step - 1 [Create Model]
*/

class UserModel {
  String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

  UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNo,
  });

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
    };
  }

  /// Step 1- Map user fetched from Firebase to UserModel
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data["Email"],
      password: data["Password"],
      fullName: data["FullName"],
      phoneNo: data["Phone"],
    );
  }
}
