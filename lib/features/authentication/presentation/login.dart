import 'package:expense_tracker/app_theme/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';


class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login>
{
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FormBuilder(
          key: _formKey,
            child: ListView(
              children: [
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
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.min(5),
                    FormBuilderValidators.max(40),
                    FormBuilderValidators.required()
                  ]),
                ),
                AppSizes.gapH20,
                ElevatedButton(onPressed: (){
                  if(_formKey.currentState!.saveAndValidate(focusOnInvalid:false)){
                    final map = _formKey.currentState!.value;
                    print(map);


                  }
                }, child: Text('Submit')),
                AppSizes.gapH20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have Account'),
                    TextButton(onPressed: (){

                    }, child: Text('Sign_Up'))
                  ],
                )

              ],
            ),
        ),
      ),

    );
  }
}
