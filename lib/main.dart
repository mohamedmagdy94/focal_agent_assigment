import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:focal_agent_assigment/feature/employee_list/view/screen/employee_list_screen.dart';
import './DI/app_container.dart' as dependancy_injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependancy_injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Focal Agent Assigment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const EmployeeListScreen(),
      builder: EasyLoading.init(),
    );
  }
}
