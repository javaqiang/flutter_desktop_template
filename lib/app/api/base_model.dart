class BaseModel {
  int? code;
  String? reason;
  bool selected = false;
  int? id;

  BaseModel({this.code, this.reason});

  BaseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['reason'] = reason;
    return data;
  }
}
