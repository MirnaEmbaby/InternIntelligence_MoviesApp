import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/modules/signup_screen/cubit/states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(InitialState());
  static SignUpCubit get(context) => BlocProvider.of(context);
}
