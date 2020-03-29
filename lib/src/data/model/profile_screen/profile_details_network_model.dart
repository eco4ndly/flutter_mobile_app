class ProfileDetailsRequestModel {
  String id;

  ProfileDetailsRequestModel({this.id});

  ProfileDetailsRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class ProfileDetailsResponseModel {
  String name;
  String id;
  String designation;

  ProfileDetailsResponseModel({this.name, this.id, this.designation});

  ProfileDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['designation'] = this.designation;
    return data;
  }
}

