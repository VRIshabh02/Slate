class NotificationCountModel {
  Ret? ret;
  Err? err;

  NotificationCountModel({this.ret, this.err});

  NotificationCountModel.fromJson(Map<String, dynamic> json) {
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
  int? notificationCount;
  int? totalNcPages;

  Data({this.notificationCount, this.totalNcPages});

  Data.fromJson(Map<String, dynamic> json) {
    notificationCount = json['notificationCount'];
    totalNcPages = json['total_nc_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notificationCount'] = this.notificationCount;
    data['total_nc_pages'] = this.totalNcPages;
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