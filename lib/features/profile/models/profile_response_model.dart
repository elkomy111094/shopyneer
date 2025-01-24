class ProfileResponseModel {
  ProfileResponseModel({
    required this.data,
    required this.status,
    required this.message,
  });
  late final ProfileDataModel data;
  late final bool status;
  late final String message;

  ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    data = ProfileDataModel.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = data.toJson();
    map['status'] = status;
    map['message'] = message;
    return map;
  }
}

class ProfileDataModel {
  ProfileDataModel({
    this.id,
    this.name,
    this.phoneNumber,
    this.phoneNumberCountryId,
    this.phoneNumberCountryCode,
    this.defaultLanguage,
    this.email,
    this.address,
    this.nationalityId,
    this.nationality,
    this.searchRoles,
    this.nationalId,
    this.image,
    this.genderId,
    this.companyId,
    this.genderName,
    this.cityId,
    this.roles,
    this.isActive,
    this.lastLogIn,
    this.companyBranches,
  }
  );

   String? id;
   String? name;
   String? phoneNumber;
   String? phoneNumberCountryId;
   dynamic phoneNumberCountryCode;
   dynamic defaultLanguage;
   String? email;
   dynamic address;
   String? nationalityId;
   String? nationality;
   dynamic searchRoles;
   String? nationalId;
   String? image;
   int? genderId;
   dynamic companyId;
   String? genderName;
   dynamic cityId;
   List<String>? roles;
   bool? isActive;
   String? lastLogIn;
   List<dynamic>? companyBranches;

  ProfileDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    phoneNumber = json['phoneNumber'] ?? "";
    phoneNumberCountryId = json['phoneNumberCountryId'] ?? "";
    phoneNumberCountryCode = json['phoneNumberCountryCode'];
    defaultLanguage = json['defaultLanguage'];
    email = json['email'] ?? "";
    address = json['address'];
    nationalityId = json['nationalityId'] ?? "";
    nationality = json['nationality'] ?? "";
    searchRoles = json['searchRoles'];
    nationalId = json['nationalId'] ?? "";
    image = json['image'] ?? "";
    genderId = json['genderId'] ?? 0;
    companyId = json['companyId'];
    genderName = json['genderName'] ?? "";
    cityId = json['cityId'];

    // Handle List parsing safely
    roles = (json['roles'] as List<dynamic>?)?.map((item) => item.toString()).toList() ?? [];
    isActive = json['isActive'] ?? false;
    lastLogIn = json['lastLogIn'] ?? "";

    // Safely parse List for companyBranches
    companyBranches = json['companyBranches'] is List ? List<dynamic>.from(json['companyBranches']) : [];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['phoneNumberCountryId'] = phoneNumberCountryId;
    data['phoneNumberCountryCode'] = phoneNumberCountryCode;
    data['defaultLanguage'] = defaultLanguage;
    data['email'] = email;
    data['address'] = address;
    data['nationalityId'] = nationalityId;
    data['nationality'] = nationality;
    data['searchRoles'] = searchRoles;
    data['nationalId'] = nationalId;
    data['image'] = image;
    data['genderId'] = genderId;
    data['companyId'] = companyId;
    data['genderName'] = genderName;
    data['cityId'] = cityId;
    data['roles'] = roles;
    data['isActive'] = isActive;
    data['lastLogIn'] = lastLogIn;
    data['companyBranches'] = companyBranches;
    return data;
  }
}
