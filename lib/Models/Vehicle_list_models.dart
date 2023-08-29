class VehicleListModels {
  VehicleListModels({
    this.status,
    this.msg,
    this.data,
  });

  VehicleListModels.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
  String? status;
  String? msg;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    this.vehicleId,
    this.vehicleName,
    this.type,
    this.vehicleNo,
    this.vehicleImage,
  });

  Data.fromJson(dynamic json) {
    vehicleId = json['vehicle_id'];
    vehicleName = json['vehicle_name'];
    type = json['type'];
    vehicleNo = json['vehicle_no'];
    vehicleImage = json['vehicle_image'];
  }
  String? vehicleId;
  String? vehicleName;
  String? type;
  String? vehicleNo;
  String? vehicleImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vehicle_id'] = vehicleId;
    map['vehicle_name'] = vehicleName;
    map['type'] = type;
    map['vehicle_no'] = vehicleNo;
    map['vehicle_image'] = vehicleImage;
    return map;
  }
}
