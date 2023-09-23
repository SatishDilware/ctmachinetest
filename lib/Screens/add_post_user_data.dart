import 'dart:io';
import 'package:ct_machine_test/Controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../Constants/responsive_constants.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_text_field.dart';
import '../Widgets/vehicle_type_drop_down.dart';

class AddVehicleUserData extends StatefulWidget {
  const AddVehicleUserData({Key? key}) : super(key: key);

  @override
  State<AddVehicleUserData> createState() => _AddVehicleUserDataState();
}

class _AddVehicleUserDataState extends State<AddVehicleUserData> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController noController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController insuranceController = TextEditingController();

  File? selectedImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  final LoginController loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  Container(
                    width: 340,
                    height: 200,
                    decoration: const BoxDecoration(color: Color(0xffF6F6F6)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            pickImage();
                          },
                          child: SizedBox(
                            height: 110,
                            child: Container(
                              child: selectedImage != null
                                  ? Container(
                                      width: screenWidth(context) * 0.32,
                                      height: screenHeight(context) * 0.16,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: FileImage(selectedImage!),
                                          fit: BoxFit.cover,
                                        ),
                                        border: Border.all(
                                          color: const Color(0xffDDDDDD),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Color(0xffAAAAAA),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: selectedImage == null
                                ? const Text(
                                    'Add vehicle image',
                                    style: TextStyle(
                                      color: Color(0xffAAAAAA),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  )
                                : const Text('')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20), // Add spacing
                  textField(
                    showPrefixIcon: false,
                    fillColor: const Color(0xffE8EDFF),
                    maxLines: 1,
                    prefixIcon: Icons.lock,
                    controller: nameController,
                    hintText: 'Vehicle Name',
                    borderRadius: 25,
                    keyboard: TextInputType.text,
                    obscure: false,
                  ),
                  const SizedBox(height: 20), // Add spacing
                  textField(
                    showPrefixIcon: false,
                    fillColor: const Color(0xffE8EDFF),
                    maxLines: 1,
                    prefixIcon: Icons.lock,
                    controller: noController,
                    hintText: 'Vehicle Number',
                    borderRadius: 25,
                    keyboard: TextInputType.text,
                    obscure: false,
                  ),
                  const SizedBox(height: 20), // Add spacing
                  const BusinessTypeDropdown(),
                  const SizedBox(height: 20), // Add spacing
                  textField(
                    showPrefixIcon: false,
                    fillColor: const Color(0xffE8EDFF),
                    maxLines: 1,
                    prefixIcon: Icons.lock,
                    controller: yearController,
                    hintText: 'Vehicle Manufacture Year',
                    borderRadius: 25,
                    keyboard: TextInputType.text,
                    obscure: false,
                  ),
                  const SizedBox(height: 20), // Add spacing
                  textField(
                    showPrefixIcon: false,
                    fillColor: const Color(0xffE8EDFF),
                    maxLines: 1,
                    prefixIcon: Icons.lock,
                    controller: insuranceController,
                    hintText: 'Vehicle Insurance Expiry',
                    borderRadius: 25,
                    keyboard: TextInputType.text,
                    obscure: false,
                  ),
                  const SizedBox(height: 50),
                  CustomButton(
                    buttonHeight: screenHeight(context) * 0.06,
                    radius: 25,
                    onTapFunction: () => loginController.updateVehicle(
                        nameController.text,
                        selectedImage!.path,
                        noController.text,
                        '',
                        yearController.text,
                        insuranceController.text,
                        'stateId',
                        ''),
                    buttonText: 'Submit',
                    buttonTextColor: Colors.white,
                    buttonColor: const Color(0xff567DF4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
