import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focal_agent_assigment/feature/employee_list/domain/get_employee_list_usecase.dart';
import 'package:focal_agent_assigment/feature/employee_list/entity/employee.dart';
import 'package:focal_agent_assigment/feature/employee_list/entity/employee_list_exception.dart';
import 'package:focal_agent_assigment/feature/employee_list/presentation/employee_list_event.dart';
import 'package:focal_agent_assigment/feature/employee_list/presentation/employee_list_state.dart';

class EmployeeListBloc extends Bloc<EmployeeListEvent, EmployeeListState> {
  final GetEmployeeListUsecaseContract _getEmployeeListUsecase;
  final _categories = ["HR", "IT"];
  int _selectedCategory = 0;
  List<Employee> employees = [];

  EmployeeListBloc(this._getEmployeeListUsecase)
      : super(EmployeListInitialState()) {
    _registerHandlers();
  }

  _registerHandlers() {
    _registerDataRequestHandler();
    _registerCategorySelectHandler();
    _registerUpdateDataHandler();
  }

  _registerDataRequestHandler() {
    on<EmployeeListDataRequestedEvent>((event, emit) async {
      emit(EmployeListLoadingState());
      try {
        final employesResult = await _getEmployeeListUsecase
            .getEmployeeWithTyoe(_categories[_selectedCategory], true);
        employees = employesResult;
        emit(EmployeListShowDataState());
      } catch (e) {
        if (e is EmployeeListException) {
          emit(EmployeListFailureState(e.cause));
        } else {
          emit(EmployeListFailureState('General Error'));
        }
      }
    });
  }

  _registerCategorySelectHandler() {
    on<EmployeeListCetegorySelectEvent>((event, emit) async {
      _selectedCategory = event.selectedCategoryIndex;
      employees = [];
      emit(EmployeListShowDataState());
      emit(EmployeListLoadingState());
      try {
        final employesResult = await _getEmployeeListUsecase
            .getEmployeeWithTyoe(_categories[_selectedCategory], false);
        employees = employesResult;
        emit(EmployeListShowDataState());
      } catch (e) {
        if (e is EmployeeListException) {
          emit(EmployeListFailureState(e.cause));
        } else {
          emit(EmployeListFailureState('General Error'));
        }
      }
    });
  }

  _registerUpdateDataHandler() {
    on<EmployeeListUpdateDataEvent>((event, emit) async {
      employees = [];
      emit(EmployeListShowDataState());
      emit(EmployeListLoadingState());
      try {
        final employesResult = await _getEmployeeListUsecase
            .getEmployeeWithTyoe(_categories[_selectedCategory], true);
        employees = employesResult;
        emit(EmployeListShowDataState());
      } catch (e) {
        if (e is EmployeeListException) {
          emit(EmployeListFailureState(e.cause));
        } else {
          emit(EmployeListFailureState('General Error'));
        }
      }
    });
  }
}
