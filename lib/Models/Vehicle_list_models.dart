// Define your models
class VehicleListModels {
  String? status;
  String? msg;
  List<Data>? data;

  VehicleListModels.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = List<Data>.from(json['data'].map((v) => Data.fromJson(v)));
    }
  }
}

class Data {
  String? vehicleId;
  String? vehicleName;
  String? type;
  String? vehicleNo;
  String? vehicleImage;

  Data.fromJson(Map<String, dynamic> json) {
    vehicleId = json['vehicle_id'];
    vehicleName = json['vehicle_name'];
    type = json['type'];
    vehicleNo = json['vehicle_no'];
    vehicleImage = json['vehicle_image'];
  }
}