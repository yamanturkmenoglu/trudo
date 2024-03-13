
import 'package:equatable/equatable.dart';
import 'package:trudo/features/feature_auth/feature_forgetpassword/data/model/forget_password_model.dart';

enum Status {initial, submitting, success, error, loading}

class ForgetPasswordState extends Equatable {
  final String email;
  final Status status;
  final ForgetPasswordModel? forgetPasswordModel;


  const ForgetPasswordState({required this.email, required this.status,  this.forgetPasswordModel});

  factory ForgetPasswordState.initial(){
    return const ForgetPasswordState(
      email: "" ,
      status: Status.initial,
      // userBody: UserBodyModel
    );
  }

  ForgetPasswordState copyWith({String? email, Status? status, ForgetPasswordModel? forgetPasswordModel}) {
    return ForgetPasswordState(
        email: email ?? this.email,
      status: status ?? this.status,
        forgetPasswordModel: forgetPasswordModel ?? this.forgetPasswordModel
    );
}

  @override
  
  List<Object?> get props => [email,status,forgetPasswordModel];
}