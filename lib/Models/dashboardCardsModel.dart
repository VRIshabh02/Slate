/// ret : {"data":{"liquidity":[{"current":"current","voucher_month":"Oct-21","balance":1627565.9799999997},{"current":"previous","voucher_month":"Sep-21","balance":-5674313.390000001}],"investment":[{"current":"current","voucher_month":"Oct-21","balance":-25499033.79},{"current":"previous","voucher_month":"Sep-21","balance":-27499033.79}],"recievable":[{"current":"current","voucher_month":"Oct-21","balance":-747068.36},{"current":"previous","voucher_month":"Sep-21","balance":-679456.6599999999}],"payable":[{"current":"current","voucher_month":"Oct-21","balance":2130516.2199999997},{"current":"previous","voucher_month":"Sep-21","balance":3815724.48}],"sales":[{"current":"current","amount":2105985},{"current":"previous","amount":1146816}]},"status":1,"msg":"retrived successfully"}
/// err : {"data":"","status":0}

class DashboardCardsModel {
  DashboardCardsModel({
      Ret? ret, 
      Err? err,}){
    _ret = ret;
    _err = err;
}

  DashboardCardsModel.fromJson(dynamic json) {
    _ret = json['ret'] != null ? Ret.fromJson(json['ret']) : null;
    _err = json['err'] != null ? Err.fromJson(json['err']) : null;
  }
  Ret? _ret;
  Err? _err;
DashboardCardsModel copyWith({  Ret? ret,
  Err? err,
}) => DashboardCardsModel(  ret: ret ?? _ret,
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

/// data : {"liquidity":[{"current":"current","voucher_month":"Oct-21","balance":1627565.9799999997},{"current":"previous","voucher_month":"Sep-21","balance":-5674313.390000001}],"investment":[{"current":"current","voucher_month":"Oct-21","balance":-25499033.79},{"current":"previous","voucher_month":"Sep-21","balance":-27499033.79}],"recievable":[{"current":"current","voucher_month":"Oct-21","balance":-747068.36},{"current":"previous","voucher_month":"Sep-21","balance":-679456.6599999999}],"payable":[{"current":"current","voucher_month":"Oct-21","balance":2130516.2199999997},{"current":"previous","voucher_month":"Sep-21","balance":3815724.48}],"sales":[{"current":"current","amount":2105985},{"current":"previous","amount":1146816}]}
/// status : 1
/// msg : "retrived successfully"

class Ret {
  Ret({
      Data? data, 
      int? status, 
      String? msg,}){
    _data = data;
    _status = status;
    _msg = msg;
}

  Ret.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
    _msg = json['msg'];
  }
  Data? _data;
  int? _status;
  String? _msg;
Ret copyWith({  Data? data,
  int? status,
  String? msg,
}) => Ret(  data: data ?? _data,
  status: status ?? _status,
  msg: msg ?? _msg,
);
  Data? get data => _data;
  int? get status => _status;
  String? get msg => _msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['status'] = _status;
    map['msg'] = _msg;
    return map;
  }

}

/// liquidity : [{"current":"current","voucher_month":"Oct-21","balance":1627565.9799999997},{"current":"previous","voucher_month":"Sep-21","balance":-5674313.390000001}]
/// investment : [{"current":"current","voucher_month":"Oct-21","balance":-25499033.79},{"current":"previous","voucher_month":"Sep-21","balance":-27499033.79}]
/// recievable : [{"current":"current","voucher_month":"Oct-21","balance":-747068.36},{"current":"previous","voucher_month":"Sep-21","balance":-679456.6599999999}]
/// payable : [{"current":"current","voucher_month":"Oct-21","balance":2130516.2199999997},{"current":"previous","voucher_month":"Sep-21","balance":3815724.48}]
/// sales : [{"current":"current","amount":2105985},{"current":"previous","amount":1146816}]

class Data {
  Data({
      List<Liquidity>? liquidity, 
      List<Investment>? investment, 
      List<Recievable>? recievable, 
      List<Payable>? payable, 
      List<Sales>? sales,}){
    _liquidity = liquidity;
    _investment = investment;
    _recievable = recievable;
    _payable = payable;
    _sales = sales;
}

  Data.fromJson(dynamic json) {
    if (json['liquidity'] != null) {
      _liquidity = [];
      json['liquidity'].forEach((v) {
        _liquidity?.add(Liquidity.fromJson(v));
      });
    }
    if (json['investment'] != null) {
      _investment = [];
      json['investment'].forEach((v) {
        _investment?.add(Investment.fromJson(v));
      });
    }
    if (json['recievable'] != null) {
      _recievable = [];
      json['recievable'].forEach((v) {
        _recievable?.add(Recievable.fromJson(v));
      });
    }
    if (json['payable'] != null) {
      _payable = [];
      json['payable'].forEach((v) {
        _payable?.add(Payable.fromJson(v));
      });
    }
    if (json['sales'] != null) {
      _sales = [];
      json['sales'].forEach((v) {
        _sales?.add(Sales.fromJson(v));
      });
    }
  }
  List<Liquidity>? _liquidity;
  List<Investment>? _investment;
  List<Recievable>? _recievable;
  List<Payable>? _payable;
  List<Sales>? _sales;
Data copyWith({  List<Liquidity>? liquidity,
  List<Investment>? investment,
  List<Recievable>? recievable,
  List<Payable>? payable,
  List<Sales>? sales,
}) => Data(  liquidity: liquidity ?? _liquidity,
  investment: investment ?? _investment,
  recievable: recievable ?? _recievable,
  payable: payable ?? _payable,
  sales: sales ?? _sales,
);
  List<Liquidity>? get liquidity => _liquidity;
  List<Investment>? get investment => _investment;
  List<Recievable>? get recievable => _recievable;
  List<Payable>? get payable => _payable;
  List<Sales>? get sales => _sales;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_liquidity != null) {
      map['liquidity'] = _liquidity?.map((v) => v.toJson()).toList();
    }
    if (_investment != null) {
      map['investment'] = _investment?.map((v) => v.toJson()).toList();
    }
    if (_recievable != null) {
      map['recievable'] = _recievable?.map((v) => v.toJson()).toList();
    }
    if (_payable != null) {
      map['payable'] = _payable?.map((v) => v.toJson()).toList();
    }
    if (_sales != null) {
      map['sales'] = _sales?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// current : "current"
/// amount : 2105985

class Sales {
  Sales({
      String? current, 
      int? amount,}){
    _current = current;
    _amount = amount;
}

  Sales.fromJson(dynamic json) {
    _current = json['current'];
    _amount = json['amount'];
  }
  String? _current;
  int? _amount;
Sales copyWith({  String? current,
  int? amount,
}) => Sales(  current: current ?? _current,
  amount: amount ?? _amount,
);
  String? get current => _current;
  int? get amount => _amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current'] = _current;
    map['amount'] = _amount;
    return map;
  }

}

/// current : "current"
/// voucher_month : "Oct-21"
/// balance : 2130516.2199999997

class Payable {
  Payable({
      String? current, 
      String? voucherMonth, 
      double? balance,}){
    _current = current;
    _voucherMonth = voucherMonth;
    _balance = balance;
}

  Payable.fromJson(dynamic json) {
    _current = json['current'];
    _voucherMonth = json['voucher_month'];
    _balance = json['balance'];
  }
  String? _current;
  String? _voucherMonth;
  double? _balance;
Payable copyWith({  String? current,
  String? voucherMonth,
  double? balance,
}) => Payable(  current: current ?? _current,
  voucherMonth: voucherMonth ?? _voucherMonth,
  balance: balance ?? _balance,
);
  String? get current => _current;
  String? get voucherMonth => _voucherMonth;
  double? get balance => _balance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current'] = _current;
    map['voucher_month'] = _voucherMonth;
    map['balance'] = _balance;
    return map;
  }

}

/// current : "current"
/// voucher_month : "Oct-21"
/// balance : -747068.36

class Recievable {
  Recievable({
      String? current, 
      String? voucherMonth, 
      double? balance,}){
    _current = current;
    _voucherMonth = voucherMonth;
    _balance = balance;
}

  Recievable.fromJson(dynamic json) {
    _current = json['current'];
    _voucherMonth = json['voucher_month'];
    _balance = json['balance'];
  }
  String? _current;
  String? _voucherMonth;
  double? _balance;
Recievable copyWith({  String? current,
  String? voucherMonth,
  double? balance,
}) => Recievable(  current: current ?? _current,
  voucherMonth: voucherMonth ?? _voucherMonth,
  balance: balance ?? _balance,
);
  String? get current => _current;
  String? get voucherMonth => _voucherMonth;
  double? get balance => _balance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current'] = _current;
    map['voucher_month'] = _voucherMonth;
    map['balance'] = _balance;
    return map;
  }

}

/// current : "current"
/// voucher_month : "Oct-21"
/// balance : -25499033.79

class Investment {
  Investment({
      String? current, 
      String? voucherMonth, 
      double? balance,}){
    _current = current;
    _voucherMonth = voucherMonth;
    _balance = balance;
}

  Investment.fromJson(dynamic json) {
    _current = json['current'];
    _voucherMonth = json['voucher_month'];
    _balance = json['balance'];
  }
  String? _current;
  String? _voucherMonth;
  double? _balance;
Investment copyWith({  String? current,
  String? voucherMonth,
  double? balance,
}) => Investment(  current: current ?? _current,
  voucherMonth: voucherMonth ?? _voucherMonth,
  balance: balance ?? _balance,
);
  String? get current => _current;
  String? get voucherMonth => _voucherMonth;
  double? get balance => _balance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current'] = _current;
    map['voucher_month'] = _voucherMonth;
    map['balance'] = _balance;
    return map;
  }

}

/// current : "current"
/// voucher_month : "Oct-21"
/// balance : 1627565.9799999997

class Liquidity {
  Liquidity({
      String? current, 
      String? voucherMonth, 
      double? balance,}){
    _current = current;
    _voucherMonth = voucherMonth;
    _balance = balance;
}

  Liquidity.fromJson(dynamic json) {
    _current = json['current'];
    _voucherMonth = json['voucher_month'];
    _balance = json['balance'];
  }
  String? _current;
  String? _voucherMonth;
  double? _balance;
Liquidity copyWith({  String? current,
  String? voucherMonth,
  double? balance,
}) => Liquidity(  current: current ?? _current,
  voucherMonth: voucherMonth ?? _voucherMonth,
  balance: balance ?? _balance,
);
  String? get current => _current;
  String? get voucherMonth => _voucherMonth;
  double? get balance => _balance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current'] = _current;
    map['voucher_month'] = _voucherMonth;
    map['balance'] = _balance;
    return map;
  }

}