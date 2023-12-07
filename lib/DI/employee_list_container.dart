import 'package:focal_agent_assigment/DI/service_locator.dart';
import 'package:focal_agent_assigment/feature/employee_list/domain/get_employee_list_usecase.dart';
import 'package:focal_agent_assigment/feature/employee_list/reprository/employee_remote_reprository.dart';
import 'package:focal_agent_assigment/feature/employee_list/reprository/employee_reprository.dart';

class EmployeeListContainer extends ServiceLocator {
  EmployeeListContainer() {
    init();
  }

  @override
  void init() async {
    serviceLocator.registerFactory<EmployeeReprository>(
        () => EmployeeRemoteReprository());
    serviceLocator.registerFactory<GetEmployeeListUsecaseContract>(
        () => GetEmployeeListUsecase(serviceLocator()));
  }
}
