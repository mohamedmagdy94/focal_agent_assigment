import '../entity/employee.dart';

abstract class EmployeeReprository {
  Future<List<Employee>> getAll(bool forceRefresh);
}
