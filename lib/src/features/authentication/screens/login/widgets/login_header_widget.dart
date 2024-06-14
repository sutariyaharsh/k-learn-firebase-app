import 'package:flutter/material.dart';

import '../../../../../constants/image_string.dart';
import '../../../../../constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            image: AssetImage(tWelcomeScreenImage),
            height: size.height * 0.2
        ),
        Text(tLogoTitle, style: Theme.of(context).textTheme.headlineSmall,),
        Text(tLoginSubTitle, style: Theme.of(context).textTheme.bodyLarge,),
      ],
    );
  }
}