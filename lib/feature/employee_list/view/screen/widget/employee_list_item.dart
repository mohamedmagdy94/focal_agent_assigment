import 'package:flutter/material.dart';
import 'package:focal_agent_assigment/feature/employee_list/entity/employee.dart';

class EmployeeListItem extends StatelessWidget {
  final Employee employee;

  const EmployeeListItem({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.orange,
        child: Text(employee.id.toString()),
      ),
      title: Text('First Name : ${employee.firstName}'),
      subtitle: Text('Last Name : ${employee.lastName}'),
    );
  }
}
