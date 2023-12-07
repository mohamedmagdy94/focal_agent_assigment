import 'dart:convert';

EmployeeResponse employeeResponseFromJson(String str) =>
    EmployeeResponse.fromJson(json.decode(str));

String employeeResponseToJson(EmployeeResponse data) =>
    json.encode(data.toJson());

class EmployeeResponse {
  List<Employee> data;

  EmployeeResponse({
    required this.data,
  });

  factory EmployeeResponse.fromJson(Map<String, dynamic> json) =>
      EmployeeResponse(
        data:
            List<Employee>.from(json["data"].map((x) => Employee.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Employee {
  int id;
  String firstName;
  String lastName;
  String category;

  Employee({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.category,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "category": category,
      };
}
