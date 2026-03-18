import 'package:e_commerce_pro/features/auth/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final UserModel user; // بنرجع بيانات اليوزر لو نجح
  const AuthSuccess(this.user);
}
class AuthFailure extends AuthState {
  final String errMessage; // بنرجع رسالة الخطأ لو فشل
  const AuthFailure(this.errMessage);
}