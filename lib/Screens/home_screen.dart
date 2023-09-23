import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/login_controller.dart';
import 'add_post_user_data.dart';

class VehicleListScreen extends StatelessWidget {
  final LoginController loginController = Get.find<LoginController>();

  VehicleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Vehicle List'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const AddVehicleUserData(

                  // Pass other vehicle data here
                  ));
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Obx(() {
        if (loginController.loading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (loginController.hasError.value) {
          return const Center(child: Text('Error fetching data'));
        } else if (loginController.vehicleList.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          return ListView.builder(
            itemCount: loginController.vehicleList.length,
            itemBuilder: (context, index) {
              final vehicle = loginController.vehicleList[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(vehicle.vehicleImage ?? ''),
                ),
                title: Text(vehicle.vehicleName ?? ''),
                subtitle: Text(vehicle.vehicleNo ?? ''),
              );
            },
          );
        }
      }),
    );
  }
}
