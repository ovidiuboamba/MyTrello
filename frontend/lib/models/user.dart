class User {
  String? email;
  String? firstName;
  String? lastName;
  String? department;
  String? role;
  String? password;

  User(
      {this.email,
        this.firstName,
        this.lastName,
        this.department,
        this.role,
        this.password});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    department = json['department'];
    role = json['role'];
    password = json['password'];
  }

  String returnWithQuotes(String string){
    string = string.padLeft(string.length+1, '\"');
    string = string.padRight(string.length+1, '\"');
    return string;
  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = Map<String, dynamic>();
    data['\"email\"'] = returnWithQuotes(this.email.toString());
    data['\"first_name\"'] = returnWithQuotes(this.firstName.toString());
    data['\"last_name\"'] = returnWithQuotes(this.lastName.toString());
    data['\"department\"'] = this.department;
    data['\"role\"'] = this.role;
    data['\"password\"'] = returnWithQuotes(this.password.toString());
    return data;
  }
}
