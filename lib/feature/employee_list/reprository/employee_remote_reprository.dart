import 'package:flutter/services.dart';
import 'package:focal_agent_assigment/feature/employee_list/entity/employee.dart';
import 'package:focal_agent_assigment/feature/employee_list/entity/employee_list_exception.dart';

import 'employee_reprository.dart';

class EmployeeRemoteReprository implements EmployeeReprository {
  List<Employee> _employess = [];

  @override
  Future<List<Employee>> getAll(bool forceRefresh) async {
    final String responseString =
        await rootBundle.loadString('assets/sample.json');
    try {
      final employeeResponse = employeeResponseFromJson(responseString);
      return Future.delayed(
          const Duration(seconds: 5), () => employeeResponse.data);
    } catch (e) {
      return Future.error(EmployeeListException('Bad Response'));
    }
  }
}
