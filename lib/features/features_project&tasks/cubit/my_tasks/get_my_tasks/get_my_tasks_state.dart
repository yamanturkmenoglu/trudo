
import 'package:equatable/equatable.dart';
import 'package:trudo/features/features_project&tasks/data/model/maytaskmodel.dart';

abstract class MyTaskState extends Equatable {}

class MyTaskInitial extends MyTaskState {
  @override
  List<Object> get props => [];
}

class MyTaskLoading extends MyTaskState {
  @override
  List<Object> get props => [];
}

class MyTaskDone extends MyTaskState {
  final List<MyTaskModel> myTask;

  MyTaskDone({required this.myTask});

  @override
  List<Object> get props => [];
}

class AddMyTaskDone extends MyTaskState {
  @override
  List<Object> get props => [];
}

class MyTaskFailure extends MyTaskState {
  @override
  List<Object> get props => [];
}
