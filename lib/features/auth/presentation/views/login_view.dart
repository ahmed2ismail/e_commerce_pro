import 'package:e_commerce_pro/core/utils/app_assets.dart';
import 'package:e_commerce_pro/features/auth/presentation/views/widgets/social_icon_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/utils/app_colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 34.h),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 34.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 73.h),

                // حقول اللوجن (Email & Password)
                const CustomTextFormField(labelText: 'Email'),
                const CustomTextFormField(
                  labelText: 'Password',
                  obscureText: true,
                ),
                SizedBox(height: 16.h),
                // زرار Forgot your password?
                GestureDetector(
                  onTap: () {
                    // هنا هنروح لشاشة الـ Forgot Password لما نكودها
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot your password? ',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.black,
                        ),
                      ),
                      SvgPicture.asset(
                        AppAssets.arrowRed,
                        height: 24.h,
                        width: 24.w,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 28.h),
                // زرار الـ LOGIN
                CustomButton(text: 'LOGIN', onPressed: () {}),

                SizedBox(height: 150.h),

                Center(
                  child: Text(
                    'Or login with social account',
                    style: TextStyle(fontSize: 14.sp, color: AppColors.black),
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialIconContainer(AppAssets.googleIcon),
                    SizedBox(width: 16.w),
                    socialIconContainer(AppAssets.facebookIcon),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
