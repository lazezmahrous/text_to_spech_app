// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_to_spech/text_to_spech_app.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';

void main() async {
  await setupGetit();
  await ScreenUtil.ensureScreenSize();
  runApp(
    TextToSpechApp(
      appRouter: AppRouter(),
    ),
  );
}
