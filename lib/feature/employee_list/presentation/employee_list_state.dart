import 'package:equatable/equatable.dart';
import 'package:focal_agent_assigment/feature/employee_list/entity/employee.dart';

abstract class EmployeeListState extends Equatable {}

class EmployeListInitialState extends EmployeeListState {
  @override
  List<Object?> get props => [];
}

class EmployeeListShowCategoriesState extends EmployeeListState {
  final List<String> categories;

  EmployeeListShowCategoriesState(this.categories);

  @override
  List<Object?> get props => [categories];
}

class EmployeListLoadingState extends EmployeeListState {
  @override
  List<Object?> get props => [];
}

class EmployeListShowDataState extends EmployeeListState {
  EmployeListShowDataState();

  @override
  List<Object?> get props => [];
}

class EmployeListFailureState extends EmployeeListState {
  final String errorMessage;
  EmployeListFailureState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
