import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Models/Vehicle_list_models.dart';
import '../Screens/home_screen.dart';

class LoginController extends GetxController {
  final passwordController = TextEditingController().obs;
  final numberController = TextEditingController().obs;
  RxBool loading = false.obs;
  var hasError = false.obs;

  Future<Map<String, dynamic>> loginUser() async {
    final url =
        Uri.parse("https://creativethoughtsinfo.com/nmt/Api/login_user");
    final response = await http.post(
      url,
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        "mobile": "8871770279",
        "password": "123456",
        "fcm_token": "check_fcm_token",
        "device_type": "1",
      }),
    );
    Get.to(() => VehicleListScreen());

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login user');
    }
  }

  RxList<Data> vehicleList = <Data>[].obs;

  // This function fetches the vehicle list data from the API
  Future<void> fetchVehicleList() async {
    final url =
        Uri.parse("https://creativethoughtsinfo.com/nmt/Api/vehicle_list");
    final response = await http.post(
      url,
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic>{"user_id": "2"}),
    );

    if (response.statusCode == 200) {
      final vehicleListData =
          VehicleListModels.fromJson(json.decode(response.body));
      vehicleList.assignAll(vehicleListData.data ?? []);
    } else {
      hasError.value = true; // Set hasError to true if an error occurs
      throw Exception('Failed to fetch vehicle list');
    }
  }

//This function is updates the new vehicle in API......
  Future<void> updateVehicle(
    String vehicleId,
    String name,
    String image,
    String regNo,
    String type,
    String manufactureYear,
    String insuranceExpiry,
    String stateId,
  ) async {
    final url =
        Uri.parse("https://creativethoughtsinfo.com/nmt/Api/update_vehicle");
    final response = await http.post(
      url,
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        "vehicle_id": vehicleId,
        "name": name,
        "image": image,
        "reg_no": regNo,
        "type": type,
        "manufacture_year": manufactureYear,
        "insurance_expiry": insuranceExpiry,
        "state_id": stateId,
      }),
    );

    if (response.statusCode == 200) {
      Get.to(() => VehicleListScreen());
      await fetchVehicleList();
    } else {
      throw Exception('Failed to update vehicle');
    }
  }
}
