// import 'package:ct_machine_test/Controller/login_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'add_post_user_data.dart';
//
// class VehicleListScreen extends StatefulWidget {
//   const VehicleListScreen({super.key});
//
//   @override
//   State<VehicleListScreen> createState() => _VehicleListScreenState();
// }
//
// class _VehicleListScreenState extends State<VehicleListScreen> {
//   final LoginController loginController = Get.put(LoginController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:
//           AppBar(title: const Center(child: Text('My Vehicle List')), actions: [
//         IconButton(
//           onPressed: () {
//             Get.to(() => const AddVehicleUserData());
//           },
//           icon: const Icon(Icons.add),
//         )
//       ]),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder(
//                 future: loginController.getPostApi(),
//                 builder: (context, snapShot) {
//                   if (snapShot.hasData) {
//                     return const Center(child: Text('Loading...'));
//                   } else {
//                     return ListView.builder(
//                         itemCount: loginController.vehicleList.length,
//                         itemBuilder: (context, index) {
//                           return ListTile(
//                             leading: CircleAvatar(
//                               backgroundImage: NetworkImage(loginController
//                                   .vehicleList[index].vehicleImage
//                                   .toString()),
//                             ),
//                             title: Text(loginController
//                                 .vehicleList[index].vehicleName
//                                 .toString()),
//                             subtitle: Text(loginController
//                                 .vehicleList[index].vehicleNo
//                                 .toString()),
//                           );
//                         });
//                   }
//                 }),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ct_machine_test/Controller/login_controller.dart';
import 'add_post_user_data.dart';

class VehicleListScreen extends StatefulWidget {
  const VehicleListScreen({Key? key}) : super(key: key);

  @override
  State<VehicleListScreen> createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends State<VehicleListScreen> {
  final LoginController loginController = Get.put(LoginController());
  late Future<void> _fetchDataFuture;

  @override
  void initState() {
    super.initState();
    _fetchDataFuture = loginController.getPostApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('My Vehicle List')),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const AddVehicleUserData());
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: _fetchDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error fetching data'));
                } else {
                  return ListView.builder(
                    itemCount: loginController.vehicleList.length,
                    itemBuilder: (context, index) {
                      final vehicle = loginController.vehicleList[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(vehicle.vehicleImage ?? ''),
                        ),
                        title: Text(vehicle.vehicleName ?? ''),
                        subtitle: Text(vehicle.vehicleNo ?? ''),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
