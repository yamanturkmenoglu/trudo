import 'package:equatable/equatable.dart';
import 'package:trudo/features/feature_password_managment/data/model/accounts_model.dart';

abstract class AllAccountsState extends Equatable {
  const AllAccountsState();
}

class AllAccountsInitial extends AllAccountsState {
  @override
  List<Object> get props => [];
}

class AllAccountsLoading extends AllAccountsState {
  @override
  List<Object> get props => [];
}

class AllAccountsDone extends AllAccountsState {
  final List<AccountModel> account;

  const AllAccountsDone({required this.account});

  @override
  List<Object> get props => [account];
}

class AllAccountsFailure extends AllAccountsState {
  @override
  List<Object> get props => [];
}
