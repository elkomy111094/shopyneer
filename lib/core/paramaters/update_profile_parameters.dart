import 'dart:io';

class UpdateProfileParam {
  String? name;
  String? email;
  String? nationalId;
  String? nationalityId;
  File? file;
  String? gender;

  UpdateProfileParam({
    this.name,
    this.email,
    this.nationalId,
    this.nationalityId,
    this.file,
    this.gender,
  });
}
