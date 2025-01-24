class ContractsResponseModel {
  ContractsResponseModel({
    required this.data,
    required this.status,
    required this.message,
  });
  late final List<Contract> data;
  late final bool status;
  late final String message;

  ContractsResponseModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Contract.fromJson(e)).toList();
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

class Contract {
  Contract({
    required this.contractNumber,
    required this.city,
    required this.commercialRegistrationNumber,
    required this.commercialRegistrationDate,
    required this.headquarters,
    required this.companyMobileNumber,
    required this.companyEmail,
    required this.laborRecruitmentLicense,
    required this.centerOfCommunication,
    required this.id,
    required this.shiftName,
    required this.companyName,
    required this.companyBranchName,
    required this.userName,
    required this.userAddres,
    required this.isDeleted,
    required this.orderStatus,
    required this.createdOn,
    this.lastUpdatedOn,
    required this.paymentStatus,
    required this.nationalityName,
    required this.agreementDuration,
    required this.code,
    required this.firstVisit,
    required this.countOfWorker,
    required this.countOfVisit,
    required this.servicePriceDetailsId,
    required this.price,
    required this.tax,
    required this.descount,
    required this.shiftId,
    required this.companyBranchId,
    required this.orderStatusId,
    required this.paymentStatusId,
    required this.userAddresId,
    required this.nationalityId,
    required this.orderDays,
  });
  late final int contractNumber;
  late final String city;
  late final String commercialRegistrationNumber;
  late final String commercialRegistrationDate;
  late final String headquarters;
  late final String companyMobileNumber;
  late final String companyEmail;
  late final String laborRecruitmentLicense;
  late final String centerOfCommunication;
  late final String id;
  late final String shiftName;
  late final String companyName;
  late final String companyBranchName;
  late final String userName;
  late final String userAddres;
  late final bool isDeleted;
  late final String orderStatus;
  late final String createdOn;
  late final Null lastUpdatedOn;
  late final String paymentStatus;
  late final String nationalityName;
  late final String agreementDuration;
  late final int code;
  late final String firstVisit;
  late final int countOfWorker;
  late final int countOfVisit;
  late final String servicePriceDetailsId;
  late final double price;
  late final double tax;
  late final double descount;
  late final String shiftId;
  late final String companyBranchId;
  late final int orderStatusId;
  late final int paymentStatusId;
  late final String userAddresId;
  late final String nationalityId;
  late final List<OrderDays> orderDays;

  Contract.fromJson(Map<String, dynamic> json) {
    contractNumber = json['contractNumber'];
    city = json['city'];
    commercialRegistrationNumber = json['commercialRegistrationNumber'];
    commercialRegistrationDate = json['commercialRegistrationDate'];
    headquarters = json['headquarters'];
    companyMobileNumber = json['companyMobileNumber'];
    companyEmail = json['companyEmail'] ?? "";
    laborRecruitmentLicense = json['laborRecruitmentLicense'] ?? "";
    centerOfCommunication = json['centerOfCommunication'] ?? "";
    id = json['id'];
    shiftName = json['shiftName'];
    companyName = json['companyName'];
    companyBranchName = json['companyBranchName'];
    userName = json['userName'];
    userAddres = json['userAddres'];
    isDeleted = json['isDeleted'];
    orderStatus = json['orderStatus'];
    createdOn = json['createdOn'];
    lastUpdatedOn = null;
    paymentStatus = json['paymentStatus'];
    nationalityName = json['nationalityName'];
    agreementDuration = json['agreementDuration'];
    code = json['code'];
    firstVisit = json['firstVisit'];
    countOfWorker = json['countOfWorker'];
    countOfVisit = json['countOfVisit'];
    servicePriceDetailsId = json['servicePriceDetailsId'];
    price = json['price'] ?? "";
    tax = json['tax'];
    descount = json['descount'];
    shiftId = json['shiftId'];
    companyBranchId = json['companyBranchId'];
    orderStatusId = json['orderStatusId'];
    paymentStatusId = json['paymentStatusId'];
    userAddresId = json['userAddresId'];
    nationalityId = json['nationalityId'];
    orderDays =
        List.from(json['orderDays']).map((e) => OrderDays.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['contractNumber'] = contractNumber;
    data['city'] = city;
    data['commercialRegistrationNumber'] = commercialRegistrationNumber;
    data['commercialRegistrationDate'] = commercialRegistrationDate;
    data['headquarters'] = headquarters;
    data['companyMobileNumber'] = companyMobileNumber;
    data['companyEmail'] = companyEmail;
    data['laborRecruitmentLicense'] = laborRecruitmentLicense;
    data['centerOfCommunication'] = centerOfCommunication;
    data['id'] = id;
    data['shiftName'] = shiftName;
    data['companyName'] = companyName;
    data['companyBranchName'] = companyBranchName;
    data['userName'] = userName;
    data['userAddres'] = userAddres;
    data['isDeleted'] = isDeleted;
    data['orderStatus'] = orderStatus;
    data['createdOn'] = createdOn;
    data['lastUpdatedOn'] = lastUpdatedOn;
    data['paymentStatus'] = paymentStatus;
    data['nationalityName'] = nationalityName;
    data['agreementDuration'] = agreementDuration;
    data['code'] = code;
    data['firstVisit'] = firstVisit;
    data['countOfWorker'] = countOfWorker;
    data['countOfVisit'] = countOfVisit;
    data['servicePriceDetailsId'] = servicePriceDetailsId;
    data['price'] = price;
    data['tax'] = tax;
    data['descount'] = descount;
    data['shiftId'] = shiftId;
    data['companyBranchId'] = companyBranchId;
    data['orderStatusId'] = orderStatusId;
    data['paymentStatusId'] = paymentStatusId;
    data['userAddresId'] = userAddresId;
    data['nationalityId'] = nationalityId;
    data['orderDays'] = orderDays.map((e) => e.toJson()).toList();
    return data;
  }
}

class OrderDays {
  OrderDays({
    required this.id,
    required this.orderId,
    required this.dayOfWeekId,
    required this.dayOfWeek,
  });
  late final String id;
  late final String orderId;
  late final int dayOfWeekId;
  late final String dayOfWeek;

  OrderDays.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['orderId'];
    dayOfWeekId = json['dayOfWeekId'];
    dayOfWeek = json['dayOfWeek'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['orderId'] = orderId;
    data['dayOfWeekId'] = dayOfWeekId;
    data['dayOfWeek'] = dayOfWeek;
    return data;
  }
}
