
import 'package:expense_tracker/features/shared/user_stream_provider.dart';
import 'package:expense_tracker/routes/routes_enum.dart';
import 'package:expense_tracker/screens/home_screen.dart';
import 'package:expense_tracker/screens/login_screen.dart';
import 'package:expense_tracker/screens/register_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_routes.g.dart';

@riverpod
GoRouter  router(Ref ref) {
  final userState = ref.watch(userStreamProvider);
  return  GoRouter(
      redirect: (context, state){
        final authenticated = userState.valueOrNull !=null;
        final authenticating = (state.matchedLocation == '/login_screen' || state.matchedLocation == '/register_screen');
        if(authenticated == false){
          return authenticating ? null : '/login_screen';
        }
        return null;
      },
      routes: [
        GoRoute(
            path: '/',
          pageBuilder: (context, state){
              return NoTransitionPage(child: HomeScreen());
          }
        ),
        GoRoute(
            path: '/login',
            pageBuilder: (context, state){
              return NoTransitionPage(child: LoginScreen());
            }
        ),
        GoRoute(
            path: '/SignUp',
            name: AppRoute.signup.name,
            pageBuilder: (context, state){
              return NoTransitionPage(child: RegisterScreen());
            }
        ),
      ]
  );
}
