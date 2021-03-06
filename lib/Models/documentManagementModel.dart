class DocumentManagementModel {
  Ret? ret;
  Err? err;

  DocumentManagementModel({this.ret, this.err});

  DocumentManagementModel.fromJson(Map<String, dynamic> json) {
    ret = json['ret'] != null ? new Ret.fromJson(json['ret']) : null;
    err = json['err'] != null ? new Err.fromJson(json['err']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ret != null) {
      data['ret'] = this.ret!.toJson();
    }
    if (this.err != null) {
      data['err'] = this.err!.toJson();
    }
    return data;
  }
}

class Ret {
  List<DataDocument>? data;
  int? status;
  String? msg;

  Ret({this.data, this.status, this.msg});

  Ret.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataDocument>[];
      json['data'].forEach((v) {
        data!.add(new DataDocument.fromJson(v));
      });
    }
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['msg'] = this.msg;
    return data;
  }
}

class DataDocument {
  int? id;
  String? folderPath;
  int? salesInvCnt;
  int? purchaseInvCnt;
  int? banksatementCnt;
  int? otherCnt;
  String? updatedOn;
  String? name;
  Null? createdBy;
  int? crcId;

  DataDocument(
      {this.id,
        this.folderPath,
        this.salesInvCnt,
        this.purchaseInvCnt,
        this.banksatementCnt,
        this.otherCnt,
        this.updatedOn,
        this.name,
        this.createdBy,
        this.crcId});

  DataDocument.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    folderPath = json['folder_path'];
    salesInvCnt = json['sales_inv_cnt'];
    purchaseInvCnt = json['purchase_inv_cnt'];
    banksatementCnt = json['banksatement_cnt'];
    otherCnt = json['other_cnt'];
    updatedOn = json['updated_on'];
    name = json['name'];
    createdBy = json['created_by'];
    crcId = json['crc_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['folder_path'] = this.folderPath;
    data['sales_inv_cnt'] = this.salesInvCnt;
    data['purchase_inv_cnt'] = this.purchaseInvCnt;
    data['banksatement_cnt'] = this.banksatementCnt;
    data['other_cnt'] = this.otherCnt;
    data['updated_on'] = this.updatedOn;
    data['name'] = this.name;
    data['created_by'] = this.createdBy;
    data['crc_id'] = this.crcId;
    return data;
  }
}

class Err {
  String? data;
  int? status;

  Err({this.data, this.status});

  Err.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['status'] = this.status;
    return data;
  }
}