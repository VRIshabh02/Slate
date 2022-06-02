class OrganizationsListByUserId {
  OrganizationsListByUserId({
    required this.ret,
    required this.err,
  });
  late final Ret ret;
  late final Err err;

  OrganizationsListByUserId.fromJson(Map<String, dynamic> json){
    ret = Ret.fromJson(json['ret']);
    err = Err.fromJson(json['err']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ret'] = ret.toJson();
    _data['err'] = err.toJson();
    return _data;
  }
}

class Ret {
  Ret({
    required this.data,
    required this.status,
    required this.msg,
  });
  late final List<Data> data;
  late final int status;
  late final String msg;

  Ret.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['status'] = status;
    _data['msg'] = msg;
    return _data;
  }
}

class Data {
  Data({
    required this.orgId,
    required this.orgName,
    required this.code,
    required this.status,
    required this.createdOn,
    required this.orgType,
    required this.updatedOn,
    required this.createdBy,
    required this.primaryContact,
  });
  late final int orgId;
  late final String orgName;
  late final String code;
  late final String status;
  late final String createdOn;
  late final String orgType;
  late final String updatedOn;
  late final String createdBy;
  late final String primaryContact;

  Data.fromJson(Map<String, dynamic> json){
    orgId = json['org_id'];
    orgName = json['org_name'];
    code = json['code'];
    status = json['status'];
    createdOn = json['created_on'];
    orgType = json['org_type'];
    updatedOn = json['updated_on'];
    createdBy = json['created_by'];
    primaryContact = json['primary_contact'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['org_id'] = orgId;
    _data['org_name'] = orgName;
    _data['code'] = code;
    _data['status'] = status;
    _data['created_on'] = createdOn;
    _data['org_type'] = orgType;
    _data['updated_on'] = updatedOn;
    _data['created_by'] = createdBy;
    _data['primary_contact'] = primaryContact;
    return _data;
  }
}

class Err {
  Err({
    required this.data,
    required this.status,
  });
  late final String data;
  late final int status;

  Err.fromJson(Map<String, dynamic> json){
    data = json['data'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data;
    _data['status'] = status;
    return _data;
  }
}