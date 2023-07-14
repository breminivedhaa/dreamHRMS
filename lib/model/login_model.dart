// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  Data? data;

  LoginModel({
    this.data,
  });

  LoginModel copyWith({
    Data? data,
  }) =>
      LoginModel(
        data: data ?? this.data,
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  Headers headers;
  DataOriginal? original;
  dynamic? exception;

  Data({
    required this.headers,
    this.original,
    this.exception,
  });

  Data copyWith({
    Headers? headers,
    DataOriginal? original,
    dynamic exception,
  }) =>
      Data(
        headers: headers ?? this.headers,
        original: original ?? this.original,
        exception: exception ?? this.exception,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    headers: Headers.fromJson(json["headers"]),
    original: DataOriginal.fromJson(json["original"]),
    exception: json["exception"],
  );

  Map<String, dynamic> toJson() => {
    "headers": headers.toJson(),
    "original": original?.toJson(),
    "exception": exception,
  };
}

class Headers {
  Headers();

  Headers copyWith(
) =>
Headers(
    );

factory Headers.fromJson(Map<String, dynamic> json) => Headers(
    );

Map<String, dynamic> toJson() => {
};
}

class DataOriginal {
  String? accessToken;
  String? tokenType;
  User? user;
  Domain? domain;
  String? companyImage;
  LibsodiyumSettings? libsodiyumSettings;

  DataOriginal({
    this.accessToken,
    this.tokenType,
    this.user,
    this.domain,
    this.companyImage,
    this.libsodiyumSettings,
  });

  DataOriginal copyWith({
    String? accessToken,
    String? tokenType,
    User? user,
    Domain? domain,
    String? companyImage,
    LibsodiyumSettings? libsodiyumSettings,
  }) =>
      DataOriginal(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        user: user ?? this.user,
        domain: domain ?? this.domain,
        companyImage: companyImage ?? this.companyImage,
        libsodiyumSettings: libsodiyumSettings ?? this.libsodiyumSettings,
      );

  factory DataOriginal.fromJson(Map<String, dynamic> json) => DataOriginal(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    user: User.fromJson(json["user"]),
    domain: Domain.fromJson(json["domain"]),
    companyImage: json["company_image"],
    libsodiyumSettings: LibsodiyumSettings.fromJson(json["libsodiyum_settings"]),
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "user": user?.toJson(),
    "domain": domain?.toJson(),
    "company_image": companyImage,
    "libsodiyum_settings": libsodiyumSettings?.toJson(),
  };
}

class Domain {
  int? id;
  String? domain;
  String? tenantId;
  String? firstName;
  String? lastName;
  String? email;
  dynamic? jobTitle;
  String? phoneNumber;
  String? address;
  String? employeeCount;
  int? countryId;
  dynamic? createdAt;
  dynamic? updatedAt;
  dynamic? deletedAt;
  dynamic? createdBy;
  dynamic? updatedBy;
  dynamic? deletedBy;

  Domain({
    this.id,
    this.domain,
    this.tenantId,
    this.firstName,
    this.lastName,
    this.email,
    this.jobTitle,
    this.phoneNumber,
    this.address,
    this.employeeCount,
    this.countryId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
  });

  Domain copyWith({
    int? id,
    String? domain,
    String? tenantId,
    String? firstName,
    String? lastName,
    String? email,
    dynamic jobTitle,
    String? phoneNumber,
    String? address,
    String? employeeCount,
    int? countryId,
    dynamic createdAt,
    dynamic updatedAt,
    dynamic deletedAt,
    dynamic createdBy,
    dynamic updatedBy,
    dynamic deletedBy,
  }) =>
      Domain(
        id: id ?? this.id,
        domain: domain ?? this.domain,
        tenantId: tenantId ?? this.tenantId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        jobTitle: jobTitle ?? this.jobTitle,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        address: address ?? this.address,
        employeeCount: employeeCount ?? this.employeeCount,
        countryId: countryId ?? this.countryId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        createdBy: createdBy ?? this.createdBy,
        updatedBy: updatedBy ?? this.updatedBy,
        deletedBy: deletedBy ?? this.deletedBy,
      );

  factory Domain.fromJson(Map<String, dynamic> json) => Domain(
    id: json["id"],
    domain: json["domain"],
    tenantId: json["tenant_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    jobTitle: json["job_title"],
    phoneNumber: json["phone_number"],
    address: json["address"],
    employeeCount: json["employee_count"],
    countryId: json["country_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    deletedBy: json["deleted_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "domain": domain,
    "tenant_id": tenantId,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "job_title": jobTitle,
    "phone_number": phoneNumber,
    "address": address,
    "employee_count": employeeCount,
    "country_id": countryId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "deleted_by": deletedBy,
  };
}

class LibsodiyumSettings {
  Headers? headers;
  LibsodiyumSettingsOriginal? original;
  dynamic exception;

  LibsodiyumSettings({
    this.headers,
    this.original,
    this.exception,
  });

  LibsodiyumSettings copyWith({
    Headers? headers,
    LibsodiyumSettingsOriginal? original,
    dynamic exception,
  }) =>
      LibsodiyumSettings(
        headers: headers ?? this.headers,
        original: original ?? this.original,
        exception: exception ?? this.exception,
      );

  factory LibsodiyumSettings.fromJson(Map<String, dynamic> json) => LibsodiyumSettings(
    headers: Headers.fromJson(json["headers"]),
    original: LibsodiyumSettingsOriginal.fromJson(json["original"]),
    exception: json["exception"],
  );

  Map<String, dynamic> toJson() => {
    "headers": headers?.toJson(),
    "original": original?.toJson(),
    "exception": exception,
  };
}

class LibsodiyumSettingsOriginal {
  String? code;
  String? message;
  List<Datum>? data;

  LibsodiyumSettingsOriginal({
    this.code,
    this.message,
    this.data,
  });

  LibsodiyumSettingsOriginal copyWith({
    String? code,
    String? message,
    List<Datum>? data,
  }) =>
      LibsodiyumSettingsOriginal(
        code: code ?? this.code,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory LibsodiyumSettingsOriginal.fromJson(Map<String, dynamic> json) => LibsodiyumSettingsOriginal(
    code: json["code"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  int? requestEnc;
  int? responseEnc;
  dynamic createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.requestEnc,
    this.responseEnc,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  Datum copyWith({
    int? id,
    int? requestEnc,
    int? responseEnc,
    dynamic createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Datum(
        id: id ?? this.id,
        requestEnc: requestEnc ?? this.requestEnc,
        responseEnc: responseEnc ?? this.responseEnc,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    requestEnc: json["request_enc"],
    responseEnc: json["response_enc"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "request_enc": requestEnc,
    "response_enc": responseEnc,
    "created_by": createdBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? emailId;
  String? gender;
  String? maritalStatus;
  Country? country;
  DateTime? dateOfBirth;
  State? state;
  City? city;
  String? personalEmail;
  String? bloodGroup;
  String? profileImage;
  int? companyId;
  int? jobTitleId;
  int? branchId;
  int? departmentId;
  int? shiftId;
  int? reportingToId;
  int? role;
  String? mobileNumber;
  dynamic? inviteRef;
  EmployeeType? employeeType;
  int? status;
  int? userImport;
  DateTime? createdAt;
  String? userUniqueId;
  List<Role>? roles;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.emailId,
    this.gender,
    this.maritalStatus,
    this.country,
    this.dateOfBirth,
    this.state,
    this.city,
    this.personalEmail,
    this.bloodGroup,
    this.profileImage,
    this.companyId,
    this.jobTitleId,
    this.branchId,
    this.departmentId,
    this.shiftId,
    this.reportingToId,
    this.role,
    this.mobileNumber,
    this.inviteRef,
    this.employeeType,
    this.status,
    this.userImport,
    this.createdAt,
    this.userUniqueId,
    this.roles,
  });

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? emailId,
    String? gender,
    String? maritalStatus,
    Country? country,
    DateTime? dateOfBirth,
    State? state,
    City? city,
    String? personalEmail,
    String? bloodGroup,
    String? profileImage,
    int? companyId,
    int? jobTitleId,
    int? branchId,
    int? departmentId,
    int? shiftId,
    int? reportingToId,
    int? role,
    String? mobileNumber,
    dynamic inviteRef,
    EmployeeType? employeeType,
    int? status,
    int? userImport,
    DateTime? createdAt,
    String? userUniqueId,
    List<Role>? roles,
  }) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        emailId: emailId ?? this.emailId,
        gender: gender ?? this.gender,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        country: country ?? this.country,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        state: state ?? this.state,
        city: city ?? this.city,
        personalEmail: personalEmail ?? this.personalEmail,
        bloodGroup: bloodGroup ?? this.bloodGroup,
        profileImage: profileImage ?? this.profileImage,
        companyId: companyId ?? this.companyId,
        jobTitleId: jobTitleId ?? this.jobTitleId,
        branchId: branchId ?? this.branchId,
        departmentId: departmentId ?? this.departmentId,
        shiftId: shiftId ?? this.shiftId,
        reportingToId: reportingToId ?? this.reportingToId,
        role: role ?? this.role,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        inviteRef: inviteRef ?? this.inviteRef,
        employeeType: employeeType ?? this.employeeType,
        status: status ?? this.status,
        userImport: userImport ?? this.userImport,
        createdAt: createdAt ?? this.createdAt,
        userUniqueId: userUniqueId ?? this.userUniqueId,
        roles: roles ?? this.roles,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    emailId: json["email_id"],
    gender: json["gender"],
    maritalStatus: json["marital_status"],
    country: Country.fromJson(json["country"]),
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    state: State.fromJson(json["state"]),
    city: City.fromJson(json["city"]),
    personalEmail: json["personal_email"],
    bloodGroup: json["blood_group"],
    profileImage: json["profile_image"],
    companyId: json["company_id"],
    jobTitleId: json["job_title_id"],
    branchId: json["branch_id"],
    departmentId: json["department_id"],
    shiftId: json["shift_id"],
    reportingToId: json["reporting_to_id"],
    role: json["role"],
    mobileNumber: json["mobile_number"],
    inviteRef: json["invite_ref"],
    employeeType: EmployeeType.fromJson(json["employee_type"]),
    status: json["status"],
    userImport: json["import"],
    createdAt: DateTime.parse(json["created_at"]),
    userUniqueId: json["user_unique_id"],
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email_id": emailId,
    "gender": gender,
    "marital_status": maritalStatus,
    "country": country?.toJson(),
    "date_of_birth": "${dateOfBirth?.year.toString().padLeft(4, '0')}-${dateOfBirth?.month.toString().padLeft(2, '0')}-${dateOfBirth?.day.toString().padLeft(2, '0')}",
    "state": state?.toJson(),
    "city": city?.toJson(),
    "personal_email": personalEmail,
    "blood_group": bloodGroup,
    "profile_image": profileImage,
    "company_id": companyId,
    "job_title_id": jobTitleId,
    "branch_id": branchId,
    "department_id": departmentId,
    "shift_id": shiftId,
    "reporting_to_id": reportingToId,
    "role": role,
    "mobile_number": mobileNumber,
    "invite_ref": inviteRef,
    "employee_type": employeeType?.toJson(),
    "status": status,
    "import": userImport,
    "created_at": createdAt?.toIso8601String(),
    "user_unique_id": userUniqueId,
    "roles": List<dynamic>.from(roles!.map((x) => x.toJson())),
  };
}

class City {
  int? id;
  String? name;
  String? stateId;
  String? stateCode;
  String? countryId;
  String? countryCode;
  String? latitude;
  String? longitude;

  City({
    this.id,
    this.name,
    this.stateId,
    this.stateCode,
    this.countryId,
    this.countryCode,
    this.latitude,
    this.longitude,
  });

  City copyWith({
    int? id,
    String? name,
    String? stateId,
    String? stateCode,
    String? countryId,
    String? countryCode,
    String? latitude,
    String? longitude,
  }) =>
      City(
        id: id ?? this.id,
        name: name ?? this.name,
        stateId: stateId ?? this.stateId,
        stateCode: stateCode ?? this.stateCode,
        countryId: countryId ?? this.countryId,
        countryCode: countryCode ?? this.countryCode,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
    stateId: json["state_id"],
    stateCode: json["state_code"],
    countryId: json["country_id"],
    countryCode: json["country_code"],
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "state_id": stateId,
    "state_code": stateCode,
    "country_id": countryId,
    "country_code": countryCode,
    "latitude": latitude,
    "longitude": longitude,
  };
}

class Country {
  int? id;
  String? name;
  String? iso3;
  String? iso2;
  String? phoneCode;
  String? capital;
  String? currency;
  String? native;
  String? emoji;
  String? emojiU;
  DateTime? createdAt;

  Country({
    this.id,
    this.name,
    this.iso3,
    this.iso2,
    this.phoneCode,
    this.capital,
    this.currency,
    this.native,
    this.emoji,
    this.emojiU,
    this.createdAt,
  });

  Country copyWith({
    int? id,
    String? name,
    String? iso3,
    String? iso2,
    String? phoneCode,
    String? capital,
    String? currency,
    String? native,
    String? emoji,
    String? emojiU,
    DateTime? createdAt,
  }) =>
      Country(
        id: id ?? this.id,
        name: name ?? this.name,
        iso3: iso3 ?? this.iso3,
        iso2: iso2 ?? this.iso2,
        phoneCode: phoneCode ?? this.phoneCode,
        capital: capital ?? this.capital,
        currency: currency ?? this.currency,
        native: native ?? this.native,
        emoji: emoji ?? this.emoji,
        emojiU: emojiU ?? this.emojiU,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    name: json["name"],
    iso3: json["iso3"],
    iso2: json["iso2"],
    phoneCode: json["phone_code"],
    capital: json["capital"],
    currency: json["currency"],
    native: json["native"],
    emoji: json["emoji"],
    emojiU: json["emojiU"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "iso3": iso3,
    "iso2": iso2,
    "phone_code": phoneCode,
    "capital": capital,
    "currency": currency,
    "native": native,
    "emoji": emoji,
    "emojiU": emojiU,
    "created_at": createdAt?.toIso8601String(),
  };
}

class EmployeeType {
  String? id;
  String? type;

  EmployeeType({
    this.id,
    this.type,
  });

  EmployeeType copyWith({
    String? id,
    String? type,
  }) =>
      EmployeeType(
        id: id ?? this.id,
        type: type ?? this.type,
      );

  factory EmployeeType.fromJson(Map<String, dynamic> json) => EmployeeType(
    id: json["id"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
  };
}

class Role {
  int? id;
  String? name;
  GuardName? guardName;
  DateTime? createdAt;
  DateTime? updatedAt;
  RolePivot? pivot;
  List<Permission>? permissions;

  Role({
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
    this.pivot,
    this.permissions,
  });

  Role copyWith({
    int? id,
    String? name,
    GuardName? guardName,
    DateTime? createdAt,
    DateTime? updatedAt,
    RolePivot? pivot,
    List<Permission>? permissions,
  }) =>
      Role(
        id: id ?? this.id,
        name: name ?? this.name,
        guardName: guardName ?? this.guardName,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        pivot: pivot ?? this.pivot,
        permissions: permissions ?? this.permissions,
      );

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    guardName: guardNameValues.map[json["guard_name"]],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: RolePivot.fromJson(json["pivot"]),
    permissions: List<Permission>.from(json["permissions"].map((x) => Permission.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "guard_name": guardNameValues.reverse[guardName],
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
    "permissions": List<dynamic>.from(permissions!.map((x) => x.toJson())),
  };
}

enum GuardName { API }

final guardNameValues = EnumValues({
  "api": GuardName.API
});

class Permission {
  int? id;
  String? name;
  GuardName? guardName;
  DateTime? createdAt;
  DateTime? updatedAt;
  PermissionPivot? pivot;

  Permission({
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  Permission copyWith({
    int? id,
    String? name,
    GuardName? guardName,
    DateTime? createdAt,
    DateTime? updatedAt,
    PermissionPivot? pivot,
  }) =>
      Permission(
        id: id ?? this.id,
        name: name ?? this.name,
        guardName: guardName ?? this.guardName,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        pivot: pivot ?? this.pivot,
      );

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
    id: json["id"],
    name: json["name"],
    guardName: guardNameValues.map[json["guard_name"]],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: PermissionPivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "guard_name": guardNameValues.reverse[guardName],
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
  };
}

class PermissionPivot {
  int? roleId;
  int? permissionId;

  PermissionPivot({
    this.roleId,
    this.permissionId,
  });

  PermissionPivot copyWith({
    int? roleId,
    int? permissionId,
  }) =>
      PermissionPivot(
        roleId: roleId ?? this.roleId,
        permissionId: permissionId ?? this.permissionId,
      );

  factory PermissionPivot.fromJson(Map<String, dynamic> json) => PermissionPivot(
    roleId: json["role_id"],
    permissionId: json["permission_id"],
  );

  Map<String, dynamic> toJson() => {
    "role_id": roleId,
    "permission_id": permissionId,
  };
}

class RolePivot {
  int? modelId;
  int? roleId;
  String? modelType;

  RolePivot({
    this.modelId,
    this.roleId,
    this.modelType,
  });

  RolePivot copyWith({
    int? modelId,
    int? roleId,
    String? modelType,
  }) =>
      RolePivot(
        modelId: modelId ?? this.modelId,
        roleId: roleId ?? this.roleId,
        modelType: modelType ?? this.modelType,
      );

  factory RolePivot.fromJson(Map<String, dynamic> json) => RolePivot(
    modelId: json["model_id"],
    roleId: json["role_id"],
    modelType: json["model_type"],
  );

  Map<String, dynamic> toJson() => {
    "model_id": modelId,
    "role_id": roleId,
    "model_type": modelType,
  };
}

class State {
  int? id;
  String? name;
  int? countryId;
  String? countryCode;
  String? stateCode;

  State({
    this.id,
    this.name,
    this.countryId,
    this.countryCode,
    this.stateCode,
  });

  State copyWith({
    int? id,
    String? name,
    int? countryId,
    String? countryCode,
    String? stateCode,
  }) =>
      State(
        id: id ?? this.id,
        name: name ?? this.name,
        countryId: countryId ?? this.countryId,
        countryCode: countryCode ?? this.countryCode,
        stateCode: stateCode ?? this.stateCode,
      );

  factory State.fromJson(Map<String, dynamic> json) => State(
    id: json["id"],
    name: json["name"],
    countryId: json["country_id"],
    countryCode: json["country_code"],
    stateCode: json["state_code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_id": countryId,
    "country_code": countryCode,
    "state_code": stateCode,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
