import 'package:flutter/services.dart';
import 'package:focal_agent_assigment/feature/employee_list/entity/employee.dart';
import 'package:focal_agent_assigment/feature/employee_list/entity/employee_list_exception.dart';

import 'employee_reprository.dart';

class EmployeeRemoteReprository implements EmployeeReprository {
  List<Employee> _employess = [];

  @override
  Future<List<Employee>> getAll(bool forceRefresh) async {
    try {
      if (!forceRefresh && _employess.isNotEmpty) {
        return Future.sync(() => _employess);
      } else {
        final String responseString = await rootBundle.loadString(
            'assets/mock_response/employee_list_mock_response.json');
        final employeeResponse = employeeResponseFromJson(responseString);
        _employess = employeeResponse.data;
        return Future.delayed(
            const Duration(seconds: 3), () => employeeResponse.data);
      }
    } catch (e) {
      return Future.error(EmployeeListException('Bad Response'));
    }
  }
}
