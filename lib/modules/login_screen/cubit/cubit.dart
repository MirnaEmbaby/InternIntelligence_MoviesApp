import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/modules/login_screen/cubit/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
}
