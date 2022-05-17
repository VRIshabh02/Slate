/// ret : {"data":{"message":"Successful login.","name":"Nikhil R","id":98,"last_visited_orgId":81,"last_roleId":4,"last_org_name":"Nikhil","last_role_name":"Company Administrator","logo":"upload/file/1833735635.png","last_org_category":"MANDATE","token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJzbGF0ZS1qd3QiLCJhdWQiOiJUSEVfQVVESUVOQ0UiLCJpYXQiOjE2NTI2ODYxOTAsIm5iZiI6MTY1MjY4NjE5MCwiZXhwIjoxNjUzMjkwOTkwLCJkYXRhIjp7ImlkIjo5OH19.qi87g7kGuUzpmSu8riinxtWLF4M9B09l__1g99vjjOY"},"status":1,"msg":""}
/// err : {"data":"","status":0}

class LoginModel {
  LoginModel({
      Ret? ret, 
      Err? err,}){
    _ret = ret;
    _err = err;
}

  LoginModel.fromJson(dynamic json) {
    _ret = json['ret'] != null ? Ret.fromJson(json['ret']) : null;
    _err = json['err'] != null ? Err.fromJson(json['err']) : null;
  }
  Ret? _ret;
  Err? _err;
LoginModel copyWith({  Ret? ret,
  Err? err,
}) => LoginModel(  ret: ret ?? _ret,
  err: err ?? _err,
);
  Ret? get ret => _ret;
  Err? get err => _err;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_ret != null) {
      map['ret'] = _ret?.toJson();
    }
    if (_err != null) {
      map['err'] = _err?.toJson();
    }
    return map;
  }

}

/// data : ""
/// status : 0

class Err {
  Err({
      String? data, 
      int? status,}){
    _data = data;
    _status = status;
}

  Err.fromJson(dynamic json) {
    _data = json['data'];
    _status = json['status'];
  }
  String? _data;
  int? _status;
Err copyWith({  String? data,
  int? status,
}) => Err(  data: data ?? _data,
  status: status ?? _status,
);
  String? get data => _data;
  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = _data;
    map['status'] = _status;
    return map;
  }

}

/// data : {"message":"Successful login.","name":"Nikhil R","id":98,"last_visited_orgId":81,"last_roleId":4,"last_org_name":"Nikhil","last_role_name":"Company Administrator","logo":"upload/file/1833735635.png","last_org_category":"MANDATE","token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJzbGF0ZS1qd3QiLCJhdWQiOiJUSEVfQVVESUVOQ0UiLCJpYXQiOjE2NTI2ODYxOTAsIm5iZiI6MTY1MjY4NjE5MCwiZXhwIjoxNjUzMjkwOTkwLCJkYXRhIjp7ImlkIjo5OH19.qi87g7kGuUzpmSu8riinxtWLF4M9B09l__1g99vjjOY"}
/// status : 1
/// msg : ""

class Ret {
  Ret({
      Data? data, 
      int? status, 
      String? msg,}){
    _data = data;
    _status = status;
    _msg = msg;
}

  Ret.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
    _msg = json['msg'];
  }
  Data? _data;
  int? _status;
  String? _msg;
Ret copyWith({  Data? data,
  int? status,
  String? msg,
}) => Ret(  data: data ?? _data,
  status: status ?? _status,
  msg: msg ?? _msg,
);
  Data? get data => _data;
  int? get status => _status;
  String? get msg => _msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['status'] = _status;
    map['msg'] = _msg;
    return map;
  }

}

/// message : "Successful login."
/// name : "Nikhil R"
/// id : 98
/// last_visited_orgId : 81
/// last_roleId : 4
/// last_org_name : "Nikhil"
/// last_role_name : "Company Administrator"
/// logo : "upload/file/1833735635.png"
/// last_org_category : "MANDATE"
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJzbGF0ZS1qd3QiLCJhdWQiOiJUSEVfQVVESUVOQ0UiLCJpYXQiOjE2NTI2ODYxOTAsIm5iZiI6MTY1MjY4NjE5MCwiZXhwIjoxNjUzMjkwOTkwLCJkYXRhIjp7ImlkIjo5OH19.qi87g7kGuUzpmSu8riinxtWLF4M9B09l__1g99vjjOY"

class Data {
  Data({
      String? message, 
      String? name, 
      int? id, 
      int? lastVisitedOrgId, 
      int? lastRoleId, 
      String? lastOrgName, 
      String? lastRoleName, 
      String? logo, 
      String? lastOrgCategory, 
      String? token,}){
    _message = message;
    _name = name;
    _id = id;
    _lastVisitedOrgId = lastVisitedOrgId;
    _lastRoleId = lastRoleId;
    _lastOrgName = lastOrgName;
    _lastRoleName = lastRoleName;
    _logo = logo;
    _lastOrgCategory = lastOrgCategory;
    _token = token;
}

  Data.fromJson(dynamic json) {
    _message = json['message'];
    _name = json['name'];
    _id = json['id'];
    _lastVisitedOrgId = json['last_visited_orgId'];
    _lastRoleId = json['last_roleId'];
    _lastOrgName = json['last_org_name'];
    _lastRoleName = json['last_role_name'];
    _logo = json['logo'];
    _lastOrgCategory = json['last_org_category'];
    _token = json['token'];
  }
  String? _message;
  String? _name;
  int? _id;
  int? _lastVisitedOrgId;
  int? _lastRoleId;
  String? _lastOrgName;
  String? _lastRoleName;
  String? _logo;
  String? _lastOrgCategory;
  String? _token;
Data copyWith({  String? message,
  String? name,
  int? id,
  int? lastVisitedOrgId,
  int? lastRoleId,
  String? lastOrgName,
  String? lastRoleName,
  String? logo,
  String? lastOrgCategory,
  String? token,
}) => Data(  message: message ?? _message,
  name: name ?? _name,
  id: id ?? _id,
  lastVisitedOrgId: lastVisitedOrgId ?? _lastVisitedOrgId,
  lastRoleId: lastRoleId ?? _lastRoleId,
  lastOrgName: lastOrgName ?? _lastOrgName,
  lastRoleName: lastRoleName ?? _lastRoleName,
  logo: logo ?? _logo,
  lastOrgCategory: lastOrgCategory ?? _lastOrgCategory,
  token: token ?? _token,
);
  String? get message => _message;
  String? get name => _name;
  int? get id => _id;
  int? get lastVisitedOrgId => _lastVisitedOrgId;
  int? get lastRoleId => _lastRoleId;
  String? get lastOrgName => _lastOrgName;
  String? get lastRoleName => _lastRoleName;
  String? get logo => _logo;
  String? get lastOrgCategory => _lastOrgCategory;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['name'] = _name;
    map['id'] = _id;
    map['last_visited_orgId'] = _lastVisitedOrgId;
    map['last_roleId'] = _lastRoleId;
    map['last_org_name'] = _lastOrgName;
    map['last_role_name'] = _lastRoleName;
    map['logo'] = _logo;
    map['last_org_category'] = _lastOrgCategory;
    map['token'] = _token;
    return map;
  }

}