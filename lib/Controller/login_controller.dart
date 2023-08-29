import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../Models/Vehicle_list_models.dart';
import '../Screens/home_screen.dart';

class LoginController extends GetxController {
  final passwordController = TextEditingController().obs;
  final numberController = TextEditingController().obs;
  RxBool loading = false.obs;
  void loginApi(String mobile, password) async {
    loading.value = true;
    try {
      final response = await post(
          Uri.parse('https://creativethoughtsinfo.com/nmt/Api/login_user'),
          body: {
            'mobile': numberController.value.text,
            'password': passwordController.value.text,
          });
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        loading.value = false;
        Get.snackbar('Login Successfully!', data['Congratulations']);
        Get.to(() => const VehicleListScreen());
      } else {
        Get.snackbar('Login Failed', data['error']);
      }
    } catch (e) {
      Get.snackbar('Exception', e.toString());
    }
  }

  List<Data> vehicleList = [];

//These function is used to get or fetch data from server to client app.......

  Future<void> fetchVehicleList(Data dataItem) async {
    try {
      final response = await http.get(
        Uri.parse('https://creativethoughtsinfo.com/nmt/Api/vehicle_list'),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final vehicleListModel = VehicleListModels.fromJson(jsonData);
        print(jsonData);
        if (vehicleListModel.status == 'success') {
          vehicleList = vehicleListModel.data ?? [];
          update(); // Notify GetX that the state has changed
        } else {
          // Handle unsuccessful response here
          print('Failed to fetch vehicle list: ${vehicleListModel.msg}');
        }
      } else {
        // Handle HTTP error here
        print('HTTP error ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      // Handle exceptions here
      print('Exception while fetching vehicle list: $e');
    }
  }

  Future<void> getPostApi() async {
    final response = await http.get(
      Uri.parse('https://creativethoughtsinfo.com/nmt/Api/vehicle_list'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      vehicleList = data.map((json) => Data.fromJson(json)).toList();
    }
  }
}
