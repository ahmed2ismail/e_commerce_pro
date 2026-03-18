//ال repos اللي في الـ domain بيكون فيه "العقد" (Interface)؛ يعني بنقول إحنا عايزين ميزة الـ Login.
//ال repos اللي في الـ data بيكون فيه "التنفيذ" (Implementation)؛ يعني إزاي هننفذ الـ Login باستخدام مكتبة Dio.
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/user_model.dart';

abstract class AuthRepo {
  // العقد بيقول: أي حد هينفذ اللوجن لازم يرجع "إما" خطأ أو موديل اليوزر
  Future<Either<Failure, UserModel>> login({
    required String email, 
    required String password,
  });
}