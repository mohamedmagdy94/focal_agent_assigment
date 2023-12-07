import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focal_agent_assigment/feature/employee_list/domain/get_employee_list_usecase.dart';
import 'package:focal_agent_assigment/feature/employee_list/presentation/employee_list_event.dart';
import 'package:focal_agent_assigment/feature/employee_list/presentation/employee_list_state.dart';

class EmployeeListBloc extends Bloc<EmployeeListEvent, EmployeeListState> {
  final GetEmployeeListUsecaseContract _getEmployeeListUsecase;
  final _categories = ["HR", "IT"];
  int _selectedCategory = 0;

  EmployeeListBloc(this._getEmployeeListUsecase)
      : super(EmployeListInitialState()) {
    _registerHandlers();
  }

  _registerHandlers() {
    _registerDataRequestHandler();
    _registerCategorySelectHandler();
    _registerDataUpdateHandler();
  }

  _registerDataRequestHandler() {
    on<EmployeeListDataRequestedEvent>((event, emit) {
      emit(EmployeListLoadingState(true));
      emit(EmployeeListShowCategoriesState(_categories));
      _getEmployeeListUsecase
          .getEmployeeWithTyoe(_categories[_selectedCategory], true)
          .then((value) {
        emit(EmployeListLoadingState(false));
        emit(EmployeListShowDataState(value));
      }).onError((error, stackTrace) {
        emit(EmployeListFailureState('Error'));
      });
    });
  }

  _registerCategorySelectHandler() {
    on<EmployeeListCetegorySelectEvent>((event, emit) {
      emit(EmployeListLoadingState(true));
      _selectedCategory = event.selectedCategoryIndex;
      _getEmployeeListUsecase
          .getEmployeeWithTyoe(_categories[_selectedCategory], false)
          .then((value) {
        emit(EmployeListLoadingState(false));
        emit(EmployeListShowDataState(value));
      }).onError((error, stackTrace) {
        emit(EmployeListFailureState('Error'));
      });
    });
  }

  _registerDataUpdateHandler() {
    on<EmployeeListUpdateDataEvent>((event, emit) {
      emit(EmployeListLoadingState(true));
      _getEmployeeListUsecase
          .getEmployeeWithTyoe(_categories[_selectedCategory], true)
          .then((value) {
        emit(EmployeListLoadingState(false));
        emit(EmployeListShowDataState(value));
      }).onError((error, stackTrace) {
        emit(EmployeListFailureState('Error'));
      });
    });
  }
}
