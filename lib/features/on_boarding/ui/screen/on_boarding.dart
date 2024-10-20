import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_to_spech/core/global_widgets/app_gradient_button.dart';
import 'package:text_to_spech/core/helpers/spacing.dart';
import 'package:text_to_spech/core/theming/styles.dart';

import '../../../../core/constant/app_images.dart';
import '../../../../core/routing/routers.dart';
import '../../../../generated/l10n.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        exit(0);
        // logic
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SvgPicture.asset(
                  AppImages.onBoarding,
                ),
              ),
              Text(
                S.of(context).onBoardingDescription,
                style: TextStyles.font10GrayRegular,
              ),
              verticalSpace(30),
              AppGradientButton(
                size: Size(double.infinity, 40.h),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('onBoardingSeen', true);
                  Navigator.pushReplacementNamed(context, Routes.homeScreen);
                },
                text: S.of(context).onBoardingButtonTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
