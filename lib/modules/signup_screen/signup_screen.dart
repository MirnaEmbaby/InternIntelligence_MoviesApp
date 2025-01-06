import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/modules/signup_screen/cubit/cubit.dart';
import 'package:movies_app/modules/signup_screen/cubit/states.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        builder: (context, state) {
          return const Scaffold(
            body: Text('signup'),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
