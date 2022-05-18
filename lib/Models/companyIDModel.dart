/// ret : {"data":[{"company_id":"BDE308AD-E13F-B7EB-B40A-B00D8CBAC5EF"}],"status":1,"msg":"retrive successfully"}
/// err : {"data":"","status":0}

class CompanyIdModel {
  CompanyIdModel({
      Ret? ret, 
      Err? err,}){
    _ret = ret;
    _err = err;
}

  CompanyIdModel.fromJson(dynamic json) {
    _ret = json['ret'] != null ? Ret.fromJson(json['ret']) : null;
    _err = json['err'] != null ? Err.fromJson(json['err']) : null;
  }
  Ret? _ret;
  Err? _err;
CompanyIdModel copyWith({  Ret? ret,
  Err? err,
}) => CompanyIdModel(  ret: ret ?? _ret,
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

/// data : [{"company_id":"BDE308AD-E13F-B7EB-B40A-B00D8CBAC5EF"}]
/// status : 1
/// msg : "retrive successfully"

class Ret {
  Ret({
      List<Data>? data, 
      int? status, 
      String? msg,}){
    _data = data;
    _status = status;
    _msg = msg;
}

  Ret.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _status = json['status'];
    _msg = json['msg'];
  }
  List<Data>? _data;
  int? _status;
  String? _msg;
Ret copyWith({  List<Data>? data,
  int? status,
  String? msg,
}) => Ret(  data: data ?? _data,
  status: status ?? _status,
  msg: msg ?? _msg,
);
  List<Data>? get data => _data;
  int? get status => _status;
  String? get msg => _msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['msg'] = _msg;
    return map;
  }

}

/// company_id : "BDE308AD-E13F-B7EB-B40A-B00D8CBAC5EF"

class Data {
  Data({
      String? companyId,}){
    _companyId = companyId;
}

  Data.fromJson(dynamic json) {
    _companyId = json['company_id'];
  }
  String? _companyId;
Data copyWith({  String? companyId,
}) => Data(  companyId: companyId ?? _companyId,
);
  String? get companyId => _companyId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company_id'] = _companyId;
    return map;
  }

}