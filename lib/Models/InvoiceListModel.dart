class InvoiceListModel {
  InvoiceListModel({
    required this.ret,
    required this.err,
  });
  late final Ret ret;
  late final Err err;

  InvoiceListModel.fromJson(Map<String, dynamic> json){
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
  late final List<DataInvoiceList> data;
  late final int status;
  late final String msg;

  Ret.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>DataInvoiceList.fromJson(e)).toList();
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

class DataInvoiceList {
  DataInvoiceList({
    required this.id,
    this.invNumber,
    required this.ccyFormat,
    required this.invDueDate,
    required this.invDate,
    required this.taxFilling,
    required this.tax,
    required this.status,
    this.invoiceValue,
    this.invoiceTotal,
    required this.customerName,
    required this.customerCode,
    this.customerGstin,
    required this.createdBy,
    required this.createdOn,
    required this.updatedOn,
    this.additionalDetails,
    required this.fileAttchmnt,
  });
  late final int id;
  late final String? invNumber;
  late final String ccyFormat;
  late final String invDueDate;
  late final String invDate;
  late final String taxFilling;
  late final String tax;
  late final String status;
  late final String? invoiceValue;
  late final String? invoiceTotal;
  late final String customerName;
  late final String customerCode;
  late final String? customerGstin;
  late final String createdBy;
  late final String createdOn;
  late final String updatedOn;
  late final String? additionalDetails;
  late final List<dynamic> fileAttchmnt;

  DataInvoiceList.fromJson(Map<String, dynamic> json){
    id = json['id'];
    invNumber = json['inv_number'];
    ccyFormat = json['ccy_format'];
    invDueDate = json['inv_due_date'];
    invDate = json['inv_date'];
    taxFilling = json['taxFilling'];
    tax = json['tax'];
    status = json['status'];
    invoiceValue = json['invoice_value'];
    invoiceTotal = json['invoice_total'];
    customerName = json['customer_name'];
    customerCode = json['customer_code'];
    customerGstin = null;
    createdBy = json['created_by'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    additionalDetails = null;
    fileAttchmnt = List.castFrom<dynamic, dynamic>(json['fileAttchmnt']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['inv_number'] = invNumber;
    _data['ccy_format'] = ccyFormat;
    _data['inv_due_date'] = invDueDate;
    _data['inv_date'] = invDate;
    _data['taxFilling'] = taxFilling;
    _data['tax'] = tax;
    _data['status'] = status;
    _data['invoice_value'] = invoiceValue;
    _data['invoice_total'] = invoiceTotal;
    _data['customer_name'] = customerName;
    _data['customer_code'] = customerCode;
    _data['customer_gstin'] = customerGstin;
    _data['created_by'] = createdBy;
    _data['created_on'] = createdOn;
    _data['updated_on'] = updatedOn;
    _data['additional_details'] = additionalDetails;
    _data['fileAttchmnt'] = fileAttchmnt;
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