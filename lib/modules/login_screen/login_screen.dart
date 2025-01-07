import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/layout/layout_screen.dart';
import 'package:movies_app/modules/login_screen/cubit/cubit.dart';
import 'package:movies_app/modules/login_screen/cubit/states.dart';
import 'package:movies_app/modules/signup_screen/signup_screen.dart';
import 'package:movies_app/shared/components/components.dart';

import '../../shared/network/cache_helper.dart';
import '../../shared/styles/colors.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool errorState = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  color: defBlack,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      defTextFormField(
                        context: context,
                        isPass: false,
                        suffixIcon: null,
                        controller: emailController,
                        text: 'Email Address',
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'email must not be empty';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      defTextFormField(
                        context: context,
                        isPass: true,
                        passHidden: LoginCubit.get(context).isVisible,
                        suffixIcon: LoginCubit.get(context).suffixIcon,
                        onSuffixPressed: () =>
                            LoginCubit.get(context).changeVisibility(),
                        controller: passwordController,
                        text: 'Password',
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'password must not be empty';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      if (errorState == true)
                        Row(
                          children: [
                            const Icon(
                              Icons.error_outline_rounded,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'email address or password is incorrect',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Colors.red,
                                  ),
                            ),
                          ],
                        ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                          style: ButtonStyle(
                              padding:
                                  WidgetStateProperty.all(EdgeInsets.zero)),
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      defButton(
                        context: context,
                        text: 'Login',
                        function: () {
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Divider(
                              color: Colors.white60,
                              thickness: 0.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'or',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: Colors.white60,
                              thickness: 0.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: MaterialButton(
                              color: Colors.grey[700],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              height: 50,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 8.0,
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.email_outlined,
                                    size: 25,
                                    color: defWhite,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'Google',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: MaterialButton(
                              color: Colors.grey[700],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                              height: 50,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 8.0,
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.facebook_rounded,
                                    size: 25,
                                    color: defWhite,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'Facebook',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 12),
                          ),
                          TextButton(
                              onPressed: () {
                                navigateTo(context, SignUpScreen());
                              },
                              style: const ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                  EdgeInsets.only(left: 5.0),
                                ),
                              ),
                              child: Text(
                                'Sign up now',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is LoginSuccessState) {
            CacheHelper.saveData(key: 'uId', value: state.uId);
            navigateAndFinish(context, const LayoutScreen());
          }

          if (state is LoginErrorState) {
            errorState = true;
          }
        },
      ),
    );
  }
}
