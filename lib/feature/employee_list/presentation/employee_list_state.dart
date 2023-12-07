import 'package:equatable/equatable.dart';
import 'package:focal_agent_assigment/feature/employee_list/entity/employee.dart';

abstract class EmployeeListState extends Equatable {}

class EmployeListLoadingState extends EmployeeListState {
  final bool isLoading;
  EmployeListLoadingState(this.isLoading);

  @override
  List<Object?> get props => [isLoading];
}

class EmployeListShowDataState extends EmployeeListState {
  final List<Employee> employeesList;
  EmployeListShowDataState(this.employeesList);

  @override
  List<Object?> get props => [employeesList];
}

class EmployeListFailureState extends EmployeeListState {
  final String errorMessage;
  EmployeListFailureState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
