/// ret : {"data":[{"org_id":17,"org_name":"Rype Tech","code":"Rype","status":"TRIALACTIVE","created_on":"2020-10-21 08:27:30","org_type":"TRUST","updated_on":"2022-03-08 11:14:07","created_by":"Gaurav Saraf","primary_contact":"Gaurav Saraf "},{"org_id":26,"org_name":"Bollywood Dreams Pvt Ltd","code":"BDPL","status":"ACTIVE","created_on":"2020-10-21 08:27:30","org_type":"LLP","updated_on":"2022-03-19 08:51:30","created_by":"Gaurav Saraf","primary_contact":"Rahul Desai"},{"org_id":81,"org_name":"Nikhil Mandate","code":"Nik-Man","status":"TRIALACTIVE","created_on":"2020-10-21 12:26:08","org_type":"PVT_LTD","updated_on":"2022-04-29 17:24:41","created_by":"Nikhil  R","primary_contact":"Nikhil R"}],"status":1,"msg":""}
/// err : {"data":"","status":0}

class OrganizationsListByUserId {
  OrganizationsListByUserId({
      Ret? ret, 
      Err? err,}){
    _ret = ret;
    _err = err;
}

  OrganizationsListByUserId.fromJson(dynamic json) {
    _ret = json['ret'] != null ? Ret.fromJson(json['ret']) : null;
    _err = json['err'] != null ? Err.fromJson(json['err']) : null;
  }
  Ret? _ret;
  Err? _err;
OrganizationsListByUserId copyWith({  Ret? ret,
  Err? err,
}) => OrganizationsListByUserId(  ret: ret ?? _ret,
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

/// data : [{"org_id":17,"org_name":"Rype Tech","code":"Rype","status":"TRIALACTIVE","created_on":"2020-10-21 08:27:30","org_type":"TRUST","updated_on":"2022-03-08 11:14:07","created_by":"Gaurav Saraf","primary_contact":"Gaurav Saraf "},{"org_id":26,"org_name":"Bollywood Dreams Pvt Ltd","code":"BDPL","status":"ACTIVE","created_on":"2020-10-21 08:27:30","org_type":"LLP","updated_on":"2022-03-19 08:51:30","created_by":"Gaurav Saraf","primary_contact":"Rahul Desai"},{"org_id":81,"org_name":"Nikhil Mandate","code":"Nik-Man","status":"TRIALACTIVE","created_on":"2020-10-21 12:26:08","org_type":"PVT_LTD","updated_on":"2022-04-29 17:24:41","created_by":"Nikhil  R","primary_contact":"Nikhil R"}]
/// status : 1
/// msg : ""

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

/// org_id : 17
/// org_name : "Rype Tech"
/// code : "Rype"
/// status : "TRIALACTIVE"
/// created_on : "2020-10-21 08:27:30"
/// org_type : "TRUST"
/// updated_on : "2022-03-08 11:14:07"
/// created_by : "Gaurav Saraf"
/// primary_contact : "Gaurav Saraf "

class Data {
  Data({
      int? orgId, 
      String? orgName, 
      String? code, 
      String? status, 
      String? createdOn, 
      String? orgType, 
      String? updatedOn, 
      String? createdBy, 
      String? primaryContact,}){
    _orgId = orgId;
    _orgName = orgName;
    _code = code;
    _status = status;
    _createdOn = createdOn;
    _orgType = orgType;
    _updatedOn = updatedOn;
    _createdBy = createdBy;
    _primaryContact = primaryContact;
}

  Data.fromJson(dynamic json) {
    _orgId = json['org_id'];
    _orgName = json['org_name'];
    _code = json['code'];
    _status = json['status'];
    _createdOn = json['created_on'];
    _orgType = json['org_type'];
    _updatedOn = json['updated_on'];
    _createdBy = json['created_by'];
    _primaryContact = json['primary_contact'];
  }
  int? _orgId;
  String? _orgName;
  String? _code;
  String? _status;
  String? _createdOn;
  String? _orgType;
  String? _updatedOn;
  String? _createdBy;
  String? _primaryContact;
Data copyWith({  int? orgId,
  String? orgName,
  String? code,
  String? status,
  String? createdOn,
  String? orgType,
  String? updatedOn,
  String? createdBy,
  String? primaryContact,
}) => Data(  orgId: orgId ?? _orgId,
  orgName: orgName ?? _orgName,
  code: code ?? _code,
  status: status ?? _status,
  createdOn: createdOn ?? _createdOn,
  orgType: orgType ?? _orgType,
  updatedOn: updatedOn ?? _updatedOn,
  createdBy: createdBy ?? _createdBy,
  primaryContact: primaryContact ?? _primaryContact,
);
  int? get orgId => _orgId;
  String? get orgName => _orgName;
  String? get code => _code;
  String? get status => _status;
  String? get createdOn => _createdOn;
  String? get orgType => _orgType;
  String? get updatedOn => _updatedOn;
  String? get createdBy => _createdBy;
  String? get primaryContact => _primaryContact;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['org_id'] = _orgId;
    map['org_name'] = _orgName;
    map['code'] = _code;
    map['status'] = _status;
    map['created_on'] = _createdOn;
    map['org_type'] = _orgType;
    map['updated_on'] = _updatedOn;
    map['created_by'] = _createdBy;
    map['primary_contact'] = _primaryContact;
    return map;
  }

}