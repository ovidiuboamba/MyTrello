class Employee {
  String? firstName;
  String? lastName;
  String? role;

  Employee(this.firstName, this.lastName, this.role);

  Employee.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    role = json['role'];
  }


}