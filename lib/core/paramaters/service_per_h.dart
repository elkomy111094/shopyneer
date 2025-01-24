class ServicePerHourParam {
  int? countOfWorker;
  int? countOfVisit;
  // int? orderStatusId;
  // int? paymentStatusId;
  double? price;
  double? tax;
  double? descount;
  String? shiftId;
  String? companyBranchId;
  String? userAddresId;
  String? nationalityId;
  String? firstVisit;
  String? servicePriceDetailsId;
  List<OrderDays> orderDays = [];

  ServicePerHourParam({
    this.companyBranchId,
    this.userAddresId,
    this.nationalityId,
    required this.orderDays,
    this.countOfWorker,
    this.countOfVisit,
    // this.orderStatusId,
    // this.paymentStatusId,
    this.price,
    this.tax,
    this.descount,
    this.shiftId,
    this.firstVisit,
    this.servicePriceDetailsId,
  });

  Map<String, dynamic> toMap() {
    return {
      'companyBranchId': companyBranchId,
      'userAddresId': userAddresId,
      'nationalityId': nationalityId,
      'orderDays': orderDays,
      'countOfWorker': countOfWorker,
      'countOfVisit': countOfVisit,
      // 'orderStatusId': orderStatusId,
      // 'paymentStatusId': paymentStatusId,
      'price': price,
      'tax': tax,
      'descount': descount,
      'shiftId': shiftId,
      'firstVisit': firstVisit,
      'servicePriceDetailsId': servicePriceDetailsId,
    };
  }

  factory ServicePerHourParam.fromMap(Map<String, dynamic> map) {
    return ServicePerHourParam(
      companyBranchId: map['companyBranchId'],
      // userAddresId: map['userAddresId'],
      nationalityId: map['nationalityId'],
      orderDays: List<OrderDays>.from(map['orderDays']),
      countOfWorker: map['countOfWorker'],
      countOfVisit: map['countOfVisit'],
      // orderStatusId: map['orderStatusId'],
      // paymentStatusId: map['paymentStatusId'],
      price: map['price'],
      tax: map['tax'],
      descount: map['descount'],
      shiftId: map['shiftId'],
      firstVisit: map['firstVisit'],
      servicePriceDetailsId: map['servicePriceDetailsId'],
    );
  }
}

class OrderDays {
  int dayOfWeekId;
  String? dayOfWeek;

  OrderDays({
    required this.dayOfWeekId,
    this.dayOfWeek,
  });

  Map<String, dynamic> toMap() {
    return {
      'dayOfWeekId': dayOfWeekId,
    };
  }

  factory OrderDays.fromMap(Map<String, dynamic> map) {
    return OrderDays(
      dayOfWeekId: map['dayOfWeekId'],
      dayOfWeek: map['dayOfWeek'],
    );
  }
}
