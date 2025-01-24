class VisitsResponseModel {
  VisitsResponseModel({
    required this.data,
    required this.status,
    required this.message,
  });
  late final List<VisitModel> data;
  late final bool status;
  late final String message;

  VisitsResponseModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => VisitModel.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = data.map((e) => e.toJson()).toList();
    map['status'] = status;
    map['message'] = message;
    return map;
  }
}

class VisitModel {
  VisitModel({
    required this.date,
    required this.shiftName,
    required this.orderStatus,
    required this.contractNumber,
  });
  late final String date;
  late final String shiftName;
  late final String orderStatus;
  late final String contractNumber;

  VisitModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    shiftName = json['shiftName'];
    orderStatus = json['orderStatus'];
    contractNumber = json['contractNumber'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['date'] = date;
    data['shiftName'] = shiftName;
    data['orderStatus'] = orderStatus;
    data['contractNumber'] = contractNumber;
    return data;
  }
}
