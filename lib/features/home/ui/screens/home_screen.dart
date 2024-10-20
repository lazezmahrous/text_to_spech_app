import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:text_to_spech/core/global_widgets/app_gradient_button.dart';
import 'package:text_to_spech/core/helpers/extensions.dart';
import 'package:text_to_spech/core/helpers/spacing.dart';
import 'package:text_to_spech/core/theming/colors.dart';
import 'package:text_to_spech/core/theming/styles.dart';
import '../../../../core/constant/app_images.dart';
import '../../../../core/global_widgets/app_text_form_field.dart';
import '../../../../core/routing/routers.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/text_to_spech_request_body.dart';
import '../../logic/cubit/text_to_spach_cubit.dart';
import '../widgets/select_language_widget.dart';
import '../widgets/text_to_spech_listener.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          exit(0);
          // logic
        },
        child: Scaffold(
          body: SafeArea(
            child: Form(
              key: context.read<TextToSpachCubit>().formKay,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).homeHederTitle,
                        style: TextStyles.font24BlueBold,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: ColorsManager.lightGray,
                            ),
                            borderRadius: BorderRadius.circular(5.r),
                            shape: BoxShape.rectangle,
                          ),
                          child: InkWell(
                            onTap: () {
                              context.pushNamed(Routes.settingsScreen);
                            },
                            child: SvgPicture.asset(
                              AppImages.menue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(30),
                  AppTextFormField(
                    hintText: S.of(context).homeTextFieldHitntText,
                    keyboardType: TextInputType.multiline,
                    maxLength: 5000,
                    maxLines:
                        context.read<TextToSpachCubit>().text.text.length > 1000
                            ? 6
                            : null,
                    controller: context.read<TextToSpachCubit>().text,
                    validator: (data) {
                      final RegExp regex =
                          RegExp(r"[^a-zA-Z\u0600-\u06FF\s,'‘’]");

                      if (data!.isEmpty) {
                        return S.of(context).homeTextFieldValidatorTextIsEmpty;
                      } else if (regex.hasMatch(data)) {
                        return S.of(context).homeTextFieldValidatorOnlyLetters;
                      }
                      return null;
                    },
                  ),
                  verticalSpace(30),
                  const SelectLanguageWidget(),
                  verticalSpace(30),
                  AppGradientButton(
                    size: Size(double.infinity, 40.h),
                    text: S.of(context).homeButtonTitle,
                    onPressed: () async {
                      if (context
                          .read<TextToSpachCubit>()
                          .formKay
                          .currentState!
                          .validate()) {
                        context.read<TextToSpachCubit>().emitTextToSpechStates(
                              TextToSpechRequestBody(
                                language: context
                                    .read<TextToSpachCubit>()
                                    .languageCode!,
                                text:
                                    context.read<TextToSpachCubit>().text.text,
                              ),
                            );
                      }
                    },
                  ),
                  verticalSpace(30),
                  const TextToSpechListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
