import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_flutter_app/src/features/authentication/screens/forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';
import 'package:login_flutter_app/src/features/core/screens/dashboard/dashboard.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../forget_password/forget_password_options/forget_password_btn_widget.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: tEmail,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: tPassword,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),

            // -- FORGET PASSWORD BTN
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    ForgetPasswordScreen.buildShowModalBottomSheet(context);
                  },
                  child: Text(tForgetPassword, style: TextStyle(color: Colors.blue),)),
            ),

            // -- LOGIN BTN
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const Dashboard()),
                child: Text(tLogin.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
