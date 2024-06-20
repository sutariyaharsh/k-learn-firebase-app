import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_flutter_app/src/constants/colors.dart';
import 'package:login_flutter_app/src/constants/image_string.dart';
import 'package:login_flutter_app/src/constants/sizes.dart';
import 'package:login_flutter_app/src/constants/text_strings.dart';
import 'package:login_flutter_app/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:login_flutter_app/src/features/core/screens/profile/update_profile_screen.dart';
import 'package:login_flutter_app/src/features/core/screens/profile/widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left_solid)),
        title: Text(tProfile, style: Theme.of(context).textTheme.headlineSmall),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100), child: const Image(image: AssetImage(tProfileImage))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: tPrimaryColor),
                      child: const Icon(
                        LineAwesomeIcons.pencil_alt_solid,
                        color: Colors.black,
                        size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(tProfileHeading,
                  style: Theme.of(context).textTheme.headlineSmall),
              Text(tProfileSubHeading,
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(tEditProfile,
                      style: TextStyle(color: tDarkColor)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// Menu
              ProfileMenuWidget(
                  title: 'Settings',
                  icon: LineAwesomeIcons.cog_solid,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: 'Billing Details',
                  icon: LineAwesomeIcons.wallet_solid,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: 'User Management',
                  icon: LineAwesomeIcons.user_check_solid,
                  onPress: () {}),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: 'Information',
                  icon: LineAwesomeIcons.info_solid,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: 'Logout',
                  icon: LineAwesomeIcons.sign_out_alt_solid,
                  textColor: Colors.red,
                  endIcon: false,
                  // onPress: () {}
                  onPress: () => Get.to(() => const WelcomeScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}