

import 'package:equatable/equatable.dart';
import 'package:trudo/features/feature_auth/feature_login/data/models/login_model.dart';

enum LoginStatus {initial, submitting, success, error, loading}

class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginStatus status;
  final LoginModel? loginModel;
  final String? error;


  const LoginState({required this.email, required this.password, required this.status,  this.loginModel,this.error});

  factory LoginState.initial(){
    return  const LoginState(
      email: "" ,
      password: "",
      status: LoginStatus.initial,
      error: "Error"
      // userBody: UserBodyModel
    );
  }

  LoginState copyWith({String? email, String? password, LoginStatus? status, LoginModel? loginModel,String? error}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
      status: status ?? this.status,
        loginModel: loginModel ?? this.loginModel,
      error: error ?? this.error
    );
}

  @override
  List<Object?> get props => [email,password,status,loginModel,error];
}
