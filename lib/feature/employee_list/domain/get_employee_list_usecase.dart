import 'package:focal_agent_assigment/feature/employee_list/entity/employee.dart';
import 'package:focal_agent_assigment/feature/employee_list/entity/employee_list_exception.dart';
import 'package:focal_agent_assigment/feature/employee_list/reprository/employee_reprository.dart';

abstract class GetEmployeeListUseContract {
  Future<List<Employee>> getEmployeeWithTyoe(String type, bool isUpdated);
}

class GetEmployeeListUse implements GetEmployeeListUseContract {
  EmployeeReprository employeeReprository;

  GetEmployeeListUse(this.employeeReprository);

  @override
  Future<List<Employee>> getEmployeeWithTyoe(
      String type, bool isUpdated) async {
    try {
      final employees = await employeeReprository.getAll(isUpdated);
      final employeesFiltered =
          employees.where((element) => element.category == type).toList();
      return employeesFiltered;
    } catch (e) {
      return Future.error(EmployeeListException('Bad Response'));
    }
  }
}
