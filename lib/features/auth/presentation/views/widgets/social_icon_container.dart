  // Refactor: عملنا دالة صغيرة عشان مانكررش كود الـ Container
  import 'package:e_commerce_pro/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget socialIconContainer(String asset) {
    return Container(
      width: 92.w,
      height: 64.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: SvgPicture.asset(
        asset,
        fit: BoxFit.contain,
      ),
    );
  }
