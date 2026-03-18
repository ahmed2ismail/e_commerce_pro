import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_pro/core/utils/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // هيشتغل بس وأنت بتجرب، ومش هيظهر في النسخة النهائية
      builder: (context) => EcommercePro(), 
    ),
  );
}

class EcommercePro extends StatelessWidget {
  const EcommercePro({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtilInit: بياخد حجم الشاشة اللي المصمم اشتغل عليها في فيجما
    return ScreenUtilInit(
      designSize: const Size(375, 812), // الأبعاد القياسية لأغلب تصاميم الموبايل في فيجما
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.background,
            primaryColor: AppColors.primaryRed,
            fontFamily: 'Metropolis', // نوع الخط المستخدم في التصميم (هنضيفه لاحقاً)
          ),
          home: child,
        );
      },
      // شاشة البداية (هتكون الـ Login حالياً لحد ما نعمل الـ Splash)
      child: const Scaffold(body: Center(child: Text("Welcome Ahmed!"))),
    );
  }
}