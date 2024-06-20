import 'package:get/get.dart';
import 'package:login_flutter_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:login_flutter_app/src/repository/user_repository/user_repository.dart';

import '../../authentication/models/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  /// Step 3 - Get User Email and pass to UserRepository to fetch user record.
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if(email != null){
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  Future<List<UserModel>> getAllUser() async {
    return await _userRepo.allUsers();
  }
}