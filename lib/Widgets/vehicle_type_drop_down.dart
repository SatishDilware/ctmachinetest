import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class BusinessTypeDropdown extends StatefulWidget {
  const BusinessTypeDropdown({super.key});

  @override
  State<BusinessTypeDropdown> createState() => _BusinessTypeDropdownState();
}

class _BusinessTypeDropdownState extends State<BusinessTypeDropdown> {
  String? _selectedBusinessType;
  final List<String> _businessTypes = [
    'Car',
    'Bike',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffE8EDFF),
        borderRadius: BorderRadius.circular(25), // Add rounded corners
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          value: _selectedBusinessType,
          hint: const Text('Select Vehicle Type'),
          isExpanded: true,
          onChanged: (String? newValue) {
            setState(() {
              _selectedBusinessType = newValue;
            });
          },
          items: _businessTypes.map((String type) {
            return DropdownMenuItem<String>(
              value: type,
              child: Text(type),
            );
          }).toList(),
        ),
      ),
    );
  }
}
