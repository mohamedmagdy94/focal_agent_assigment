import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:focal_agent_assigment/feature/employee_list/domain/get_employee_list_usecase.dart';
import 'package:focal_agent_assigment/feature/employee_list/entity/employee.dart';
import 'package:focal_agent_assigment/feature/employee_list/entity/employee_list_exception.dart';
import 'package:focal_agent_assigment/feature/employee_list/presentation/employee_list_bloc.dart';
import 'package:focal_agent_assigment/feature/employee_list/presentation/employee_list_event.dart';
import 'package:focal_agent_assigment/feature/employee_list/presentation/employee_list_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'employee_list_test.mocks.dart';

@GenerateMocks(
  [
    GetEmployeeListUsecase,
  ],
)
void main() {
  late EmployeeListBloc bloc;
  late MockGetEmployeeListUsecase usecase;
  setUp(() {
    usecase = MockGetEmployeeListUsecase();
    bloc = EmployeeListBloc(usecase);
  });

  group('Fetch Data Tests', () {
    blocTest(
      'emits Show Data State when Request Data is added and a successful fetch',
      build: () {
        when(usecase.getEmployeeWithTyoe(any, any))
            .thenAnswer((realInvocation) => Future(() => [
                  Employee(
                      id: 0,
                      firstName: 'firstName',
                      lastName: 'lastName',
                      category: 'category')
                ]));
        return bloc;
      },
      act: (bloc) => bloc.add(EmployeeListDataRequestedEvent()),
      expect: () => [EmployeListLoadingState(), EmployeListShowDataState()],
    );
    blocTest(
      'emits Failure State when Request Data is added and a fetch error',
      build: () {
        when(usecase.getEmployeeWithTyoe(any, any)).thenAnswer(
            (realInvocation) => Future.error(EmployeeListException('Testing')));
        return bloc;
      },
      act: (bloc) => bloc.add(EmployeeListDataRequestedEvent()),
      expect: () =>
          [EmployeListLoadingState(), EmployeListFailureState('Testing')],
    );
  });
}
