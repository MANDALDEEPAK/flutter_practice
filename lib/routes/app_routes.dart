import 'package:expense_tracker/features/authentication/presentation/login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_routes.g.dart';

@riverpod
  GoRouter  router(Ref ref) {
  return GoRouter(
      routes: [
        GoRoute(
            path: '/',
          builder: (context, state){
              return Login();
          }
        ),
      ]
  );
}
