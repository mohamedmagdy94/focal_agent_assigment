import 'package:flutter/material.dart';
import 'package:focal_agent_assigment/feature/employee_list/entity/employee.dart';
import 'package:focal_agent_assigment/feature/employee_list/view/widget/employee_list_item.dart';
import 'package:focal_agent_assigment/feature/employee_list/view/widget/employee_list_seperator.dart';

class EmployeeList extends StatelessWidget {
  final List<Employee> employees;

  const EmployeeList({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => const EmployeeListSeperator(),
        itemCount: employees.length,
        itemBuilder: (context, index) =>
            EmployeeListItem(employee: employees[index]));
  }
}
