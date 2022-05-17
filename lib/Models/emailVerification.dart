/// ret : {"data":"","msg":"","status":0}
/// err : {"data":{"id":98},"status":1,"msg":"username exist"}

class EmailVerification {
  EmailVerification({
      Ret? ret, 
      Err? err,}){
    _ret = ret;
    _err = err;
}

  EmailVerification.fromJson(Map<String, dynamic> json) {
    _ret = Ret.fromJson(json['ret']);
    _err = Err.fromJson(json['err']);
  }
  Ret? _ret;
  Err? _err;
EmailVerification copyWith({  Ret? ret,
  Err? err,
}) => EmailVerification(  ret: ret ?? _ret,
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

/// data : {"id":98}
/// status : 1
/// msg : "username exist"

class Err {
  Err({
      // Data? data,
      dynamic status,
      dynamic msg,}){
    // _data = data;
    _status = status;
    _msg = msg;
}

  Err.fromJson(Map<String, dynamic> json) {
    // _data = Data.fromJson(json['data']);
    _status = json['status'];
    _msg = json['msg'];
  }
  // Data? _data;
  dynamic _status;
  dynamic _msg;
Err copyWith({
  // Data? data,
  dynamic status,
  dynamic msg,
}) => Err(
  // data: data ?? _data,
  status: status ?? _status,
  msg: msg ?? _msg,
);
  // Data? get data => _data;
  dynamic get status => _status;
  dynamic get msg => _msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // if (_data != null) {
    //   map['data'] = _data?.toJson();
    // }
    map['status'] = _status;
    map['msg'] = _msg;
    return map;
  }

}

/// id : 98

// class Data {
//   Data({
//       dynamic id,}){
//     _id = id;
// }
//
//   Data.fromJson(Map<String, dynamic> json) {
//     _id = json['id'];
//   }
//   dynamic _id;
// Data copyWith({  int? id,
// }) => Data(  id: id ?? _id,
// );
//   dynamic get id => _id;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     return map;
//   }
//
// }

/// data : ""
/// msg : ""
/// status : 0

class Ret {
  Ret({
      // dynamic data,
      String? msg, 
      int? status,}){
    // _data = data;
    _msg = msg;
    _status = status;
}

  Ret.fromJson(dynamic json) {
    // _data = json['data'];
    _msg = json['msg'];
    _status = json['status'];
  }
  // dynamic _data;
  dynamic _msg;
  dynamic _status;
Ret copyWith({
  // String? data,
  dynamic msg,
  dynamic status,
}) => Ret(
  // data: data ?? _data,
  msg: msg ?? _msg,
  status: status ?? _status,
);
  // dynamic get data => _data;
  dynamic get msg => _msg;
  dynamic get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map['data'] = _data;
    map['msg'] = _msg;
    map['status'] = _status;
    return map;
  }

}