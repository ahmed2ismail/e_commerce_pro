import 'package:e_commerce_pro/features/auth/presentation/manager/AuthBloc/auth_event.dart';
import 'package:e_commerce_pro/features/auth/presentation/manager/AuthBloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repos/auth_repo.dart'; // بنعمل import للعقد (Interface)

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo; // بنحقن الـ Repo هنا

  AuthBloc(this.authRepo) : super(AuthInitial()) {
    // لما اليوزر يضغط زرار اللوجن
    on<LoginSubmittedEvent>((event, emit) async {
      emit(AuthLoading()); // أول حاجة بنقول للشاشة "أنا بحمل"

      // بنطلب من الـ Repo ينفذ اللوجن
      var result = await authRepo.login(
        email: event.email,
        password: event.password,
      );

      // الـ result هيكون Either (يا خطأ يا نجاح)
      result.fold(
        (failure) => emit(AuthFailure(failure.errMessage)), // لو فشل
        (user) => emit(AuthSuccess(user)), // لو نجح ورجع UserModel
      );
    });
  }
}