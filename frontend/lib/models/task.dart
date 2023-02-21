class Task {
  int? id;
  String? email;
  String? name;
  String? description;
  String? deadline;

  Task(
      this.id,
    this.email,
    this.name,
    this.description,
    this.deadline
      );

  Task.fromJson(Map<String, dynamic> json) {
    id = json['idTask'];
    email = json['email'];
    name = json['name_task'];
    description = json['description'];
    deadline = json['deadline'];
  }

  /*String returnWithQuotes(String string){
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
    data['\"task\"'] = this.task;
    data['\"password\"'] = returnWithQuotes(this.password.toString());
    return data;
  }*/
}
