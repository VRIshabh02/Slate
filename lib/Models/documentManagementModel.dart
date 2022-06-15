class DocumentManagementModel {
  DocumentManagementModel({
    required this.ret,
    required this.err,
  });
  late final Ret ret;
  late final Err err;

  DocumentManagementModel.fromJson(Map<String, dynamic> json){
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
  late final List<DataDocumentModel> data;
  late final int status;
  late final String msg;

  Ret.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>DataDocumentModel.fromJson(e)).toList();
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

class DataDocumentModel {
  DataDocumentModel({
    required this.id,
    required this.folderPath,
    // this.salesInvCnt,
    // this.purchaseInvCnt,
    // this.banksatementCnt,
    // this.otherCnt,
    // this.updatedOn,
    required this.name,
    // this.createdBy,
    required this.crcId,
  });
  late final int id;
  late final String folderPath;
  // late final int? salesInvCnt;
  // late final int? purchaseInvCnt;
  // late final int? banksatementCnt;
  // late final int? otherCnt;
  // late final String? updatedOn;
  late final String name;
  // late final Null createdBy;
  late final int crcId;

  DataDocumentModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    folderPath = json['folder_path'];
    // salesInvCnt = null;
    // purchaseInvCnt = null;
    // banksatementCnt = null;
    // otherCnt = null;
    // updatedOn = null;
    name = json['name'];
    // createdBy = null;
    crcId = json['crc_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['folder_path'] = folderPath;
    // _data['sales_inv_cnt'] = salesInvCnt;
    // _data['purchase_inv_cnt'] = purchaseInvCnt;
    // _data['banksatement_cnt'] = banksatementCnt;
    // _data['other_cnt'] = otherCnt;
    // _data['updated_on'] = updatedOn;
    _data['name'] = name;
    // _data['created_by'] = createdBy;
    _data['crc_id'] = crcId;
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