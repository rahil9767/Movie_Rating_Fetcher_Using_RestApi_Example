class LoginApiResponceModel {
  bool? error;
  Data? data;
  String? message;

  LoginApiResponceModel({this.error, this.data, this.message});

  LoginApiResponceModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? token;
  String? name;
  List<Permissions>? permissions;
  UserAccess? userAccess;
  String? userGUID;
  String? orgId;
  String? hospitalId;
  String? groupId;
  String? typeOfUser;
  String? practiceId;
  String? roleGUID;
  String? roleName;
  bool? resetPassword;

  Data(
      {this.token,
        this.name,
        this.permissions,
        this.userAccess,
        this.userGUID,
        this.orgId,
        this.hospitalId,
        this.groupId,
        this.typeOfUser,
        this.practiceId,
        this.roleGUID,
        this.roleName,
        this.resetPassword});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
    if (json['permissions'] != null) {
      permissions = <Permissions>[];
      json['permissions'].forEach((v) {
        permissions!.add(new Permissions.fromJson(v));
      });
    }
    userAccess = json['userAccess'] != null
        ? new UserAccess.fromJson(json['userAccess'])
        : null;
    userGUID = json['userGUID'];
    orgId = json['orgId'];
    hospitalId = json['hospitalId'];
    groupId = json['groupId'];
    typeOfUser = json['typeOfUser'];
    practiceId = json['practiceId'];
    roleGUID = json['roleGUID'];
    roleName = json['roleName'];
    resetPassword = json['resetPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['name'] = this.name;
    if (this.permissions != null) {
      data['permissions'] = this.permissions!.map((v) => v.toJson()).toList();
    }
    if (this.userAccess != null) {
      data['userAccess'] = this.userAccess!.toJson();
    }
    data['userGUID'] = this.userGUID;
    data['orgId'] = this.orgId;
    data['hospitalId'] = this.hospitalId;
    data['groupId'] = this.groupId;
    data['typeOfUser'] = this.typeOfUser;
    data['practiceId'] = this.practiceId;
    data['roleGUID'] = this.roleGUID;
    data['roleName'] = this.roleName;
    data['resetPassword'] = this.resetPassword;
    return data;
  }
}

class Permissions {
  String? permissionId;
  String? permissionName;

  Permissions({this.permissionId, this.permissionName});

  Permissions.fromJson(Map<String, dynamic> json) {
    permissionId = json['permissionId'];
    permissionName = json['permissionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['permissionId'] = this.permissionId;
    data['permissionName'] = this.permissionName;
    return data;
  }
}

class UserAccess {
  int? hospitalId;
  String? hospitalName;
  List<Buildings>? buildings;

  UserAccess({this.hospitalId, this.hospitalName, this.buildings});

  UserAccess.fromJson(Map<String, dynamic> json) {
    hospitalId = json['hospitalId'];
    hospitalName = json['hospitalName'];
    if (json['buildings'] != null) {
      buildings = <Buildings>[];
      json['buildings'].forEach((v) {
        buildings!.add(new Buildings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hospitalId'] = this.hospitalId;
    data['hospitalName'] = this.hospitalName;
    if (this.buildings != null) {
      data['buildings'] = this.buildings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Buildings {
  int? buildingId;
  String? buildingName;
  List<Floors>? floors;

  Buildings({this.buildingId, this.buildingName, this.floors});

  Buildings.fromJson(Map<String, dynamic> json) {
    buildingId = json['buildingId'];
    buildingName = json['buildingName'];
    if (json['floors'] != null) {
      floors = <Floors>[];
      json['floors'].forEach((v) {
        floors!.add(new Floors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['buildingId'] = this.buildingId;
    data['buildingName'] = this.buildingName;
    if (this.floors != null) {
      data['floors'] = this.floors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Floors {
  int? floorId;
  String? floorName;
  List<Rooms>? rooms;

  Floors({this.floorId, this.floorName, this.rooms});

  Floors.fromJson(Map<String, dynamic> json) {
    floorId = json['floorId'];
    floorName = json['floorName'];
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(new Rooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['floorId'] = this.floorId;
    data['floorName'] = this.floorName;
    if (this.rooms != null) {
      data['rooms'] = this.rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rooms {
  int? roomNumber;
  String? roomName;
  List<Beds>? beds;

  Rooms({this.roomNumber, this.roomName, this.beds});

  Rooms.fromJson(Map<String, dynamic> json) {
    roomNumber = json['roomNumber'];
    roomName = json['roomName'];
    if (json['beds'] != null) {
      beds = <Beds>[];
      json['beds'].forEach((v) {
        beds!.add(new Beds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomNumber'] = this.roomNumber;
    data['roomName'] = this.roomName;
    if (this.beds != null) {
      data['beds'] = this.beds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Beds {
  String? bedId;
  String? bedNumber;
  String? patientID;

  Beds({this.bedId, this.bedNumber, this.patientID});

  Beds.fromJson(Map<String, dynamic> json) {
    bedId = json['bedId'];
    bedNumber = json['bedNumber'];
    patientID = json['patientID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bedId'] = this.bedId;
    data['bedNumber'] = this.bedNumber;
    data['patientID'] = this.patientID;
    return data;
  }
}