

import 'package:expense_tracker/features/shared/instance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_respository.g.dart';

class AuthRepository{


  Future<void> userLogin  ({required String email, required String password}) async{
    try{
      await FirebaseInstance.fireAuth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (err){
          throw'${err.message}';
    }
  }
  Future<void> userSignUp  ({required String username,required String email, required String password}) async{
    try{
      final credential =await FirebaseInstance.fireAuth.createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseInstance.userDb.doc(credential.user!.uid).set({
        'username' : username,
        'email' : email

      });
    }on FirebaseAuthException catch (err){
      print('${err.message}');
      print(err.code);
      throw'${err.message}';
    }
  }

 static Future<void> userSignOut  () async{
    try{
      await FirebaseInstance.fireAuth.signOut();
    }on FirebaseAuthException catch (err){
      throw'${err.message}';
    }
  }
}


@riverpod
AuthRepository authRepo(Ref ref) {
  return AuthRepository();
}