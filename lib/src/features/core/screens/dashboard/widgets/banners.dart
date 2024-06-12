import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_string.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class DashboardBanners extends StatelessWidget {
  const DashboardBanners({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: tCardBgColor),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Image(image: AssetImage(tBookmarkIcon), height: 30, width: 30,)),
                    Flexible(child: Image(image: AssetImage(tBannerAndroidImage), height: 80, width: 80,)),
                  ],
                ),
                const SizedBox(height: 50),
                Text(tDashboardBannerTitle1, style: txtTheme.titleSmall, maxLines: 2, overflow: TextOverflow.ellipsis,),
                Text(tDashboardBannerSubTitle, style: txtTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis,),
              ],
            ),
          ),
        ),
        const SizedBox(width: tDashboardPadding),
        Expanded(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: tCardBgColor),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: Image(image: AssetImage(tBookmarkIcon), height: 30, width: 30,)),
                        Flexible(child: Image(image: AssetImage(tBannerJavaImage), height: 80, width: 80,)),
                      ],
                    ),
                    // const SizedBox(height: 25),
                    Text(tDashboardBannerTitle2, style: txtTheme.titleSmall, overflow: TextOverflow.ellipsis,),
                    Text(tDashboardBannerSubTitle, style: txtTheme.bodySmall, overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(onPressed: () {}, child: const Text(tDashboardButton))),
            ],
          ),
        ),
      ],
    );
  }
}