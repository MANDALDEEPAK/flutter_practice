
import 'package:expense_tracker/features/authentication/data/auth_respository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<void> build() async {
    return ;
  }

  Future<void> userLogin ({required String email, required String password})async{
      state = const AsyncLoading();
      state = await AsyncValue.guard(() => ref.read(authRepoProvider).userLogin(email: email, password: password));
  }
}
