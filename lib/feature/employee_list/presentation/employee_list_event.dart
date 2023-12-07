abstract class EmployeeListEvent {}

class EmployeeListDataRequestedEvent extends EmployeeListEvent {}

class EmployeeListCetegorySelectEvent extends EmployeeListEvent {
  int selectedCategoryIndex;
  EmployeeListCetegorySelectEvent(this.selectedCategoryIndex);
}

class EmployeeListUpdateDataEvent extends EmployeeListEvent {}
