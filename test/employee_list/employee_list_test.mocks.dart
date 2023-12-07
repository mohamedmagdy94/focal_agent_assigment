// Mocks generated by Mockito 5.4.3 from annotations
// in focal_agent_assigment/test/employee_list/employee_list_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:focal_agent_assigment/feature/employee_list/domain/get_employee_list_usecase.dart'
    as _i3;
import 'package:focal_agent_assigment/feature/employee_list/entity/employee.dart'
    as _i5;
import 'package:focal_agent_assigment/feature/employee_list/reprository/employee_reprository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEmployeeReprository_0 extends _i1.SmartFake
    implements _i2.EmployeeReprository {
  _FakeEmployeeReprository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetEmployeeListUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetEmployeeListUsecase extends _i1.Mock
    implements _i3.GetEmployeeListUsecase {
  MockGetEmployeeListUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.EmployeeReprository get employeeReprository => (super.noSuchMethod(
        Invocation.getter(#employeeReprository),
        returnValue: _FakeEmployeeReprository_0(
          this,
          Invocation.getter(#employeeReprository),
        ),
      ) as _i2.EmployeeReprository);

  @override
  set employeeReprository(_i2.EmployeeReprository? _employeeReprository) =>
      super.noSuchMethod(
        Invocation.setter(
          #employeeReprository,
          _employeeReprository,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<List<_i5.Employee>> getEmployeeWithTyoe(
    String? type,
    bool? shouldGetUpdatedData,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getEmployeeWithTyoe,
          [
            type,
            shouldGetUpdatedData,
          ],
        ),
        returnValue: _i4.Future<List<_i5.Employee>>.value(<_i5.Employee>[]),
      ) as _i4.Future<List<_i5.Employee>>);
}