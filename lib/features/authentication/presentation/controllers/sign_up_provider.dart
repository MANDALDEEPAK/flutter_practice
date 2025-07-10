
import 'package:expense_tracker/features/authentication/data/auth_respository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'sign_up_provider.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  @override
  FutureOr<void> build() async {
    return ;
  }

  Future<void> userSignUp ({required String username,required String email, required String password})async{
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(authRepoProvider).userSignUp(username: username, email: email, password: password));
  }
}
