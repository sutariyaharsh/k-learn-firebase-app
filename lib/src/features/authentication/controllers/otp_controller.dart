import 'package:get/get.dart';
import 'package:login_flutter_app/src/features/core/screens/dashboard/dashboard.dart';
import '../../../repository/authentication_repository/authentication_repository.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verfyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const Dashboard()) : Get.back();
  }
}