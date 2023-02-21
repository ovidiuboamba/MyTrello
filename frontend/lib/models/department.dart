class Department {
  int? idDep;
  String? nameDep;

  Department({this.idDep, this.nameDep});

  Department.fromJson(Map<String, dynamic> json) {
    idDep = json['id_dep'];
    nameDep = json['name_dep'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_dep'] = this.idDep;
    data['name_dep'] = this.nameDep;
    return data;
  }
}
