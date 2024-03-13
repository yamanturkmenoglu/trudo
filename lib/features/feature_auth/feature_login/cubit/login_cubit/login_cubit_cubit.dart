import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:trudo/core/constens/api_links.dart';
import 'package:trudo/core/hive/Hive_class.dart';
import 'package:trudo/core/hive/user.dart';
import 'package:trudo/core/providers/user_information_provider.dart';
import 'package:trudo/features/feature_auth/feature_login/cubit/login_cubit/login_cubit_state.dart';
import 'package:trudo/features/feature_auth/feature_login/data/models/login_model.dart';
import 'package:trudo/features/feature_auth/feature_login/data/models/error_model.dart';
import 'package:trudo/widget/show_message.dart';






class LoginCubit extends Cubit<LoginState> {

  LoginCubit() : super(LoginState.initial());

  setEmail(String email){
    emit(state.copyWith(email: email, status: LoginStatus.initial));
  }

  setPassword( String password){
    emit(state.copyWith( password: password , status: LoginStatus.initial));
  }

  Future<void> loginWithCredentials({required BuildContext context}) async {
    UserInformationProvider userInformationProvider;
    userInformationProvider = Provider.of<UserInformationProvider>(context,listen: false);
  if(state.email.trim().isEmpty || state.password.trim().isEmpty){
    showMessage("Please fill all information", true);
  } else {
  emit(state.copyWith(status: LoginStatus.loading));

  if (state.status == LoginStatus.submitting) return;
  emit(state.copyWith(status: LoginStatus.submitting));


  try{


    final loginBody = {
      "email": state.email,
      "password": state.password
    };
    final response = await http.post(Uri.parse("$baseUrl/users/login"), body: loginBody);

    log(" response ${response.statusCode}  ${response.body}");

    if(response.statusCode == 200) {
      var responseUser = loginModelFromJson(response.body);

      // -------------------------- save user --------------------------------
      final user = UserHiveModel(
          accessToken: responseUser.accessToken,
          id: responseUser.user!.id,
          name: "${responseUser.user!.firstName!} ${responseUser.user!.lastName!}",
          username: responseUser.user!.username,
          password: state.password
      );
      UserBox.putBox('user', user);
      userInformationProvider.setUserHiveModel(user,state.password);

      // ----------------------------------------------------------------------
      emit(state.copyWith(status: LoginStatus.success));
      emit(state.copyWith(status: LoginStatus.initial));
    }

    else {
      emit(state.copyWith(status: LoginStatus.error,

          error: errorModelFromJson(response.body).err?.name == "IncorrectUsernameError" ? "Account not found!" :
          errorModelFromJson(response.body).err?.name == "IncorrectPasswordError" ? "Password is incorrect!" : "Error"
      ));
    }

  } catch (_){
    emit(state.copyWith(status: LoginStatus.error,error: _.toString()));
    throw "__ $_";
  }
}
  }
}