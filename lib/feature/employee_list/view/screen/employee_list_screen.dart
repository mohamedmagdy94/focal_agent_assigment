import 'package:flutter/material.dart';
import 'package:focal_agent_assigment/feature/employee_list/entity/employee.dart';
import 'package:focal_agent_assigment/feature/employee_list/view/screen/widget/employee_list.dart';
import 'package:focal_agent_assigment/feature/employee_list/view/screen/widget/employee_list_item.dart';
import 'package:focal_agent_assigment/feature/employee_list/view/screen/widget/employee_list_seperator.dart';

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
          body: Container(
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
                  employees: [
                    Employee(
                        id: 0,
                        firstName: 'Lorem Ipsum',
                        lastName: 'Lorem Ipsum',
                        category: 'HR')
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
