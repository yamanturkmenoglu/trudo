import 'package:equatable/equatable.dart';
import 'package:trudo/features/feature_password_managment/data/model/add_account_model.dart';

enum Status { initial, submitting, success, error, loading }

class EditAccountState extends Equatable {
  final AddAccountModel addAccountModel;
  final Status status;

  const EditAccountState({
    required this.addAccountModel,
    required this.status,
  });

  factory EditAccountState.initial() {
    return EditAccountState(
      status: Status.initial,
      addAccountModel:
          AddAccountModel(),
    );
  }

  EditAccountState copyWith({
    AddAccountModel? addAccountModel,
    Status? status,
  }) {
    return EditAccountState(
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
