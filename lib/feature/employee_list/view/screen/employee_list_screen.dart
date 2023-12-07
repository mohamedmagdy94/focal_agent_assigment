import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:focal_agent_assigment/DI/service_locator.dart';
import 'package:focal_agent_assigment/feature/employee_list/entity/employee.dart';
import 'package:focal_agent_assigment/feature/employee_list/presentation/employee_list_bloc.dart';
import 'package:focal_agent_assigment/feature/employee_list/presentation/employee_list_event.dart';
import 'package:focal_agent_assigment/feature/employee_list/presentation/employee_list_state.dart';
import 'package:focal_agent_assigment/feature/employee_list/view/widget/employee_list.dart';

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Employees List'),
          ),
          body: BlocProvider<EmployeeListBloc>(
            create: (_) => EmployeeListBloc(serviceLocator())
              ..add(EmployeeListDataRequestedEvent()),
            child: BlocConsumer<EmployeeListBloc, EmployeeListState>(
                listener: (listenerContext, state) {
              if (state is EmployeListLoadingState) {
                EasyLoading.show(status: 'Fetching Data ....');
              } else {
                EasyLoading.dismiss();
              }
              if (state is EmployeListFailureState) {
                EasyLoading.showError(state.errorMessage);
              }
            }, builder: (builderContext, state) {
              return Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const TabBar(tabs: [
                      Tab(
                        text: 'HR',
                      ),
                      Tab(
                        text: 'IT',
                      )
                    ]),
                    Expanded(
                      child: EmployeeList(
                          employees:
                              BlocProvider.of<EmployeeListBloc>(builderContext)
                                  .employees),
                    )
                  ],
                ),
              );
            }),
          ),
        ));
  }
}
