class NotificationListModel {
  Ret? ret;
  Err? err;

  NotificationListModel({this.ret, this.err});

  NotificationListModel.fromJson(Map<String, dynamic> json) {
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
  List<Data>? data;
  int? status;
  String? msg;

  Ret({this.data, this.status, this.msg});

  Ret.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  String? notificationType;
  String? orgLogo;
  String? title;
  String? redirectUrl;
  int? readStatus;
  String? createdDatetime;

  Data(
      {this.id,
        this.notificationType,
        this.orgLogo,
        this.title,
        this.redirectUrl,
        this.readStatus,
        this.createdDatetime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationType = json['notification_type'];
    orgLogo = json['org_logo'];
    title = json['title'];
    redirectUrl = json['redirect_url'];
    readStatus = json['read_status'];
    createdDatetime = json['created_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['notification_type'] = this.notificationType;
    data['org_logo'] = this.orgLogo;
    data['title'] = this.title;
    data['redirect_url'] = this.redirectUrl;
    data['read_status'] = this.readStatus;
    data['created_datetime'] = this.createdDatetime;
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