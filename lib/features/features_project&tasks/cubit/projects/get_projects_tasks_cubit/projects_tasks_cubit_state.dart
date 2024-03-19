
import 'package:equatable/equatable.dart';
import 'package:trudo/features/features_project&tasks/data/model/project_details_model.dart';

abstract class ProjectDetailsState extends Equatable {

}

class ProjectDetailsInitial extends ProjectDetailsState {
  @override
  List<Object> get props => [];
}

class ProjectDetailsLoading extends ProjectDetailsState {
 @override
 List<Object> get props => [];
}

class ProjectDetailsDone extends ProjectDetailsState {
 final ProjectDetailsModel projectDetails;

  ProjectDetailsDone({required this.projectDetails});

  @override
 List<Object> get props => [projectDetails];
}
class AddProjectDetailsDone extends ProjectDetailsState {
  @override
  List<Object> get props => [];
}

class ProjectDetailsFailure extends ProjectDetailsState {
 @override
 List<Object> get props => [];
}