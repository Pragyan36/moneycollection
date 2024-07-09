class ProfileData {
  int? id;
  String? uid;
  String? firstName;
  Null? middleName;
  String? lastName;
  String? email;
  String? emailVerifiedAt;
  Null? currentTeamId;
  Null? profilePhotoPath;
  String? branchCode;
  int? roleId;
  bool? isPrimary;
  int? status;
  bool? dayBegin;
  bool? enableTwofa;
  String? verifyCode;
  bool? enableVerifyCode;
  String? joinedAt;
  Null? resignedAt;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  bool? twoFactorConfirmed;
  String? profilePhotoUrl;

  ProfileData(
      {this.id,
      this.uid,
      this.firstName,
      this.middleName,
      this.lastName,
      this.email,
      this.emailVerifiedAt,
      this.currentTeamId,
      this.profilePhotoPath,
      this.branchCode,
      this.roleId,
      this.isPrimary,
      this.status,
      this.dayBegin,
      this.enableTwofa,
      this.verifyCode,
      this.enableVerifyCode,
      this.joinedAt,
      this.resignedAt,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.twoFactorConfirmed,
      this.profilePhotoUrl});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    branchCode = json['branch_code'];
    roleId = json['role_id'];
    isPrimary = json['is_primary'];
    status = json['status'];
    dayBegin = json['day_begin'];
    enableTwofa = json['enable_twofa'];
    verifyCode = json['verify_code'];
    enableVerifyCode = json['enable_verify_code'];
    joinedAt = json['joined_at'];
    resignedAt = json['resigned_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    twoFactorConfirmed = json['two_factor_confirmed'];
    profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['current_team_id'] = this.currentTeamId;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['branch_code'] = this.branchCode;
    data['role_id'] = this.roleId;
    data['is_primary'] = this.isPrimary;
    data['status'] = this.status;
    data['day_begin'] = this.dayBegin;
    data['enable_twofa'] = this.enableTwofa;
    data['verify_code'] = this.verifyCode;
    data['enable_verify_code'] = this.enableVerifyCode;
    data['joined_at'] = this.joinedAt;
    data['resigned_at'] = this.resignedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['two_factor_confirmed'] = this.twoFactorConfirmed;
    data['profile_photo_url'] = this.profilePhotoUrl;
    return data;
  }
}
