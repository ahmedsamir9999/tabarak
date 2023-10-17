class ErrorMessageModel {
  int? code;
  String? status;
  String? data;

  ErrorMessageModel({
    this.code,
    this.status,
    this.data,
  });

  ErrorMessageModel.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['status'] = status;
    map['data'] = data;
    return map;
  }
}
