import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/layout/layout_screen.dart';
import 'package:movies_app/modules/signup_screen/cubit/cubit.dart';
import 'package:movies_app/modules/signup_screen/cubit/states.dart';
import 'package:movies_app/shared/styles/colors.dart';

import '../../shared/components/components.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  bool errorState = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: defBlack.withOpacity(0),
              iconTheme: const IconThemeData(color: defWhite),
            ),
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
                        'Sign up',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      defTextFormField(
                        context: context,
                        isPass: false,
                        suffixIcon: null,
                        controller: usernameController,
                        text: 'Username',
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'username must not be empty';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      defTextFormField(
                        context: context,
                        isPass: false,
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
                        passHidden: SignUpCubit.get(context).isVisible,
                        suffixIcon: SignUpCubit.get(context).suffixIcon,
                        onSuffixPressed: () =>
                            SignUpCubit.get(context).changeVisibility(),
                        controller: passwordController,
                        text: 'Password',
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'password must not be empty';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      defButton(
                        context: context,
                        text: 'Sign up',
                        function: () {
                          SignUpCubit.get(context).signUp(
                            userName: usernameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          );
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
                            'Do you already have an account?',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 12),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: const ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                  EdgeInsets.only(left: 5.0),
                                ),
                              ),
                              child: Text(
                                'Login now',
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
          if (state is CreateUserSuccessState) {
            navigateAndFinish(context, const LayoutScreen());
          }
        },
      ),
    );
  }
}
