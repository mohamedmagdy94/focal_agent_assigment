import 'package:flutter/material.dart';

class EmployeeListSeperator extends StatelessWidget {
  const EmployeeListSeperator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.grey,
      child: Padding(
        padding: EdgeInsets.all(0.5),
      ),
    );
  }
}
