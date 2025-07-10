import 'package:expense_tracker/app_theme/app_size.dart';
import 'package:expense_tracker/features/authentication/presentation/controllers/login_controller.dart';
import 'package:expense_tracker/features/authentication/presentation/controllers/sign_up_provider.dart';
import 'package:expense_tracker/features/shared/validator_provider.dart';
import 'package:expense_tracker/routes/routes_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';


class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp>
{
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    ref.listen(loginControllerProvider, (previous, next){
      next.maybeWhen(
        data: (data){
          context.pop();
        },
          error: (err, st) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(seconds: 1),
              content: Text(err.toString()))),
          orElse: () => null);
    });

    final signUpState = ref.watch(signUpControllerProvider);
    final mode = ref.watch(validateModeControllerProvider(id: 2));
    final passShow = ref.watch(PassControllerProvider(id: 2));

    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FormBuilder(
          autovalidateMode: mode,
          key: _formKey,
          child: ListView(
            children: [
              FormBuilderTextField(
                  name: 'username',
                decoration: InputDecoration(
                  hintText: 'Username'
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.username(),
                  FormBuilderValidators.required()
                ]),
              ),
              AppSizes.gapH20,
              FormBuilderTextField(
                name: 'email',
                decoration: InputDecoration(
                    hintText: 'Email'
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.email(),
                  FormBuilderValidators.required()
                ]),
              ),
              AppSizes.gapH16,

              FormBuilderTextField(
                name: 'password',
                obscureText: passShow ? false : true,
                decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(onPressed: (){
                      ref.read(passControllerProvider(id: 2).notifier).change();
                    }, icon: Icon(passShow ? Icons.lock_open : Icons.lock))
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.minLength(5),
                  FormBuilderValidators.maxLength(40),
                  FormBuilderValidators.required()
                ]),
              ),
              AppSizes.gapH20,
              ElevatedButton(onPressed: signUpState.isLoading ? null:(){
                FocusScope.of(context).unfocus();
                if(_formKey.currentState!.saveAndValidate(focusOnInvalid:false)){
                  final map = _formKey.currentState!.value;
                  ref.read(signUpControllerProvider.notifier).userSignUp(email: map['email'], password: map['password'],username: map['username']);
                }else{
                  ref.read(validateModeControllerProvider(id: 2).notifier).change();
                }
              }, child:signUpState.isLoading ? CircularProgressIndicator() : Text('Submit')),
              AppSizes.gapH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an Account'),
                  TextButton(onPressed: (){
                    context.pop();

                  }, child: Text('Login'))
                ],
              )

            ],
          ),
        ),
      ),

    );
  }
}
