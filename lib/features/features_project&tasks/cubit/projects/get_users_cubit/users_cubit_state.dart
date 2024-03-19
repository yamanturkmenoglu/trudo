
import 'package:equatable/equatable.dart';
import 'package:trudo/features/features_project&tasks/data/model/all_users_model.dart';

abstract class AllUsersState extends Equatable {}

class AllUsersInitial extends AllUsersState {
  @override
  List<Object> get props => [];
}

class AllUsersLoading extends AllUsersState {
  @override
  List<Object> get props => [];
}

class AllUsersDone extends AllUsersState {
  final List<AllUsersModel> users;

  AllUsersDone({required this.users});

  @override
  List<Object> get props => [users];
}

class AllUsersFailure extends AllUsersState {
  @override
  List<Object> get props => [];
}
