class AddUserModel {
  AddUserModel({
    required this.ret,
    required this.err,
  });
  late final Ret ret;
  late final Err err;

  AddUserModel.fromJson(Map<String, dynamic> json){
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
    required this.msg,
    required this.status,
  });
  late final String data;
  late final String msg;
  late final int status;

  Ret.fromJson(Map<String, dynamic> json){
    data = json['data'];
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data;
    _data['msg'] = msg;
    _data['status'] = status;
    return _data;
  }
}

class Err {
  Err({
    required this.data,
    required this.status,
    required this.msg,
  });
  late final String data;
  late final int status;
  late final String msg;

  Err.fromJson(Map<String, dynamic> json){
    data = json['data'];
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data;
    _data['status'] = status;
    _data['msg'] = msg;
    return _data;
  }
}