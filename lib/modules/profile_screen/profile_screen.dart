import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/layout/cubit/cubit.dart';
import 'package:movies_app/layout/cubit/states.dart';
import 'package:movies_app/shared/styles/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (context, state) {
        var model = AppCubit.get(context).userModel;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: defBlack,
            iconTheme: const IconThemeData(
              color: defWhite,
            ),
          ),
          body: Container(
            color: defBlack,
            width: double.infinity,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        model!.image,
                      ),
                      radius: 70.0,
                    ),
                    CircleAvatar(
                      radius: 18.0,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
