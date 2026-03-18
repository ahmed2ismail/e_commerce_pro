//ال repos اللي في الـ domain بيكون فيه "العقد" (Interface)؛ يعني بنقول إحنا عايزين ميزة الـ Login.
//ال repos اللي في الـ data بيكون فيه "التنفيذ" (Implementation)؛ يعني إزاي هننفذ الـ Login باستخدام مكتبة Dio.
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepoImpl implements AuthRepo {
  final Dio dio; // بنحقن Dio هنا عشان نستخدمه

  AuthRepoImpl(this.dio);

  @override
  Future<Either<Failure, UserModel>> login({required String email, required String password}) async {
    try {
      var response = await dio.post(
        'https://dummyjson.com/auth/login',
        data: {
          'username': email, // DummyJSON بيستخدم username للوجن
          'password': password,
        },
      );

      return right(UserModel.fromJson(response.data));
    } catch (e) {
      // هنا بنتعامل مع أخطاء السيرفر باحترافية
      return left(ServerFailure(e.toString()));
    }
  }
}