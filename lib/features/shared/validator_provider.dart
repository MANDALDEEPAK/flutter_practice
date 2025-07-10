import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/enums.dart';
part 'validator_provider.g.dart';

@riverpod
class ValidateModeController extends _$ValidateModeController {
  @override
  AutovalidateMode build({required int id}) {
    return AutovalidateMode.disabled;
  }


  void change(){
    state = AutovalidateMode.onUserInteraction;
  }
}


@riverpod
class PassController extends _$PassController {
  @override
bool build({required int id}) {
    return false;
  }

  void change(){
    state = !state;
  }
}