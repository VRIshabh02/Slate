class TallySyncModel {
  Ret? ret;
  Err? err;

  TallySyncModel({this.ret, this.err});

  TallySyncModel.fromJson(Map<String, dynamic> json) {
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
  List<DataTallySync>? data;
  int? status;
  String? msg;

  Ret({this.data, this.status, this.msg});

  Ret.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataTallySync>[];
      json['data'].forEach((v) {
        data!.add(new DataTallySync.fromJson(v));
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

class DataTallySync {
  String? fileName;
  String? tallyOrgName;
  String? userName;
  String? uploadedBy;
  String? uploadedOn;
  String? tallyStatus;
  String? tallyMode;

  DataTallySync(
      {this.fileName,
        this.tallyOrgName,
        this.userName,
        this.uploadedBy,
        this.uploadedOn,
        this.tallyStatus,
        this.tallyMode});

  DataTallySync.fromJson(Map<String, dynamic> json) {
    fileName = json['file_name'];
    tallyOrgName = json['Tally_Org_name'];
    userName = json['user_name'];
    uploadedBy = json['uploaded_by'];
    uploadedOn = json['uploaded_on'];
    tallyStatus = json['tally_status'];
    tallyMode = json['tally_Mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file_name'] = this.fileName;
    data['Tally_Org_name'] = this.tallyOrgName;
    data['user_name'] = this.userName;
    data['uploaded_by'] = this.uploadedBy;
    data['uploaded_on'] = this.uploadedOn;
    data['tally_status'] = this.tallyStatus;
    data['tally_Mode'] = this.tallyMode;
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