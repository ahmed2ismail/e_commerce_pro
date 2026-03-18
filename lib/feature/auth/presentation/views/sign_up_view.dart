import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/utils/app_colors.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // عشان الشاشة ماتعملش Overflow لما الكيبورد يفتح
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w), // مسافة موحدة من الجنبين
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // يبدأ الكلام من الشمال
              children: [
                SizedBox(height: 34.h), // مسافة من فوق خالص
                Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 34.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 73.h), // مسافة بين العنوان والحقول
                
                // حقول الإدخال باستخدام الـ Custom Widgets اللي عملناها
                const CustomTextFormField(labelText: 'Name'),
                const CustomTextFormField(labelText: 'Email'),
                const CustomTextFormField(
                  labelText: 'Password',
                  obscureText: true, // عشان الباسورد يظهر نجوم
                ),
                
                SizedBox(height: 16.h),
                
                // سطر "Already have an account?"
                Row(
                  mainAxisAlignment: MainAxisAlignment.end, // الكلام يروح يمين
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(fontSize: 14.sp, color: AppColors.black),
                    ),
                    Icon(Icons.arrow_forward, color: AppColors.primaryRed, size: 20.sp),
                  ],
                ),
                
                SizedBox(height: 28.h),
                
                // الزرار الأحمر الكبير
                CustomButton(
                  text: 'SIGN UP',
                  onPressed: () {
                    // هنا هنربط الـ Logic بتاع الـ Bloc مستقبلاً
                  },
                ),
                
                SizedBox(height: 120.h), // مسافة قبل الجزء السفلي
                
                Center(
                  child: Text(
                    'Or sign up with social account',
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