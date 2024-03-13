

import 'package:equatable/equatable.dart';
import 'package:trudo/features/features_project&tasks/data/model/projects_model.dart';

abstract class ProjectsState extends Equatable {}

class ProjectsInitial extends ProjectsState {
  @override
  List<Object> get props => [];
}

class ProjectsLoading extends ProjectsState {
  @override
  List<Object> get props => [];
}

class ProjectsDone extends ProjectsState {
  final List<ProjectsModel> projects;

  ProjectsDone({required this.projects});

  @override
  List<Object> get props => [];
}

class AddProjectsDone extends ProjectsState {
  @override
  List<Object> get props => [];
}

class ProjectsFailure extends ProjectsState {
  @override
  List<Object> get props => [];
}
