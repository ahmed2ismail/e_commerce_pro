import 'package:e_commerce_pro/feature/auth/presentation/views/login_view.dart';
import 'package:e_commerce_pro/feature/auth/presentation/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kLoginView = '/loginView';
  static const kSignUpView = '/'; // شاشة البداية

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: kLoginView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LoginView(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              // Animation احترافي (Fade + Scale)
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}