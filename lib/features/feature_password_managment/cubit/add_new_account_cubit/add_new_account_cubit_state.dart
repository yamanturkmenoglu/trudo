import 'package:equatable/equatable.dart';
import 'package:trudo/features/feature_password_managment/data/model/add_account_model.dart';

enum Status { initial, submitting, success, error, loading }

class AddAccountState extends Equatable {
  final AddAccountModel addAccountModel;
  final Status status;

  const AddAccountState({
    required this.addAccountModel,
    required this.status,
  });

  factory AddAccountState.initial() {
    return AddAccountState(
      status: Status.initial,
      addAccountModel:
          AddAccountModel(),
    );
  }

  AddAccountState copyWith({
    AddAccountModel? addAccountModel,
    Status? status,
  }) {
    return AddAccountState(
      addAccountModel: addAccountModel ?? this.addAccountModel,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        addAccountModel,
        status,
      ];
      
}
