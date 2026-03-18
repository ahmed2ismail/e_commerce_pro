import 'package:e_commerce_pro/features/auth/presentation/manager/AuthBloc/auth_event.dart';
import 'package:e_commerce_pro/features/auth/presentation/manager/AuthBloc/auth_state.dart';
import 'package:e_commerce_pro/features/auth/presentation/views/widgets/social_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:e_commerce_pro/core/utils/app_assets.dart';
import 'package:e_commerce_pro/core/utils/app_colors.dart';
import 'package:e_commerce_pro/core/utils/service_locator.dart';
import 'package:e_commerce_pro/core/widgets/custom_button.dart';
import 'package:e_commerce_pro/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_pro/features/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce_pro/features/auth/presentation/manager/AuthBloc/auth_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(getIt.get<AuthRepo>()),
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Success!'),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errMessage),
                  backgroundColor: AppColors.error,
                ),
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
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
                        ),
                      ),
                      SizedBox(height: 73.h),

                      CustomTextFormField(
                        labelText: 'Email',
                        controller: emailController,
                      ),
                      CustomTextFormField(
                        labelText: 'Password',
                        obscureText: true,
                        controller: passwordController,
                      ),

                      SizedBox(height: 16.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Forgot your password? '),
                            SvgPicture.asset(AppAssets.arrowRed, height: 24.h),
                          ],
                        ),
                      ),

                      SizedBox(height: 28.h),

                      // معالجة حالة الـ Loading
                      state is AuthLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryRed,
                              ),
                            )
                          : CustomButton(
                              text: 'LOGIN',
                              onPressed: () {
                                BlocProvider.of<AuthBloc>(context).add(
                                  LoginSubmittedEvent(
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                  ),
                                );
                              },
                            ),

                      SizedBox(height: 150.h),
                      const Center(child: Text('Or login with social account')),
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          socialIcon(AppAssets.googleIcon),
                          SizedBox(width: 16.w),
                          socialIcon(AppAssets.facebookIcon),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
