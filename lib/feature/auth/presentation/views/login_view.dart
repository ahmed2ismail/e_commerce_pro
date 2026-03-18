import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                
                const CustomTextFormField(labelText: 'Email'),
                const CustomTextFormField(
                  labelText: 'Password',
                  obscureText: true,
                ),
                
                SizedBox(height: 16.h),
                
                // زرار Forgot your password?
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Forgot your password? ',
                        style: TextStyle(fontSize: 14.sp, color: AppColors.black),
                      ),
                      Icon(Icons.arrow_forward, color: AppColors.primaryRed, size: 20.sp),
                    ],
                  ),
                ),
                
                SizedBox(height: 28.h),
                
                // زرار الـ LOGIN الأحمر
                CustomButton(
                  text: 'LOGIN',
                  onPressed: () {},
                ),
                
                SizedBox(height: 150.h), // مسافة أكبر شوية
                
                Center(
                  child: Text(
                    'Or login with social account',
                    style: TextStyle(fontSize: 14.sp, color: AppColors.black),
                  ),
                ),
                SizedBox(height: 12.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.g_mobiledata)),
                    SizedBox(width: 30),
                    CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.facebook)),
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