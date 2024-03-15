import 'package:equatable/equatable.dart';
import 'package:trudo/features/feature_password_managment/data/model/all_password_category_model.dart';

abstract class AllCategoryState extends Equatable {}

class AllCategoryInitial extends AllCategoryState {
  @override
  List<Object> get props => [];
}

class AllCategoryLoading extends AllCategoryState {
  @override
  List<Object> get props => [];
}

class AllCategoryDone extends AllCategoryState {
  final List<AllPasswordCategoryModel> category;

  AllCategoryDone({required this.category});

  @override
  List<Object> get props => [category];
}

class AllCategoryFailure extends AllCategoryState {
  @override
  List<Object> get props => [];
}
