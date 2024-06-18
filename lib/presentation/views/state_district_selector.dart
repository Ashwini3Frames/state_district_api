import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_district_api/presentation/controllers/state_controller.dart';

class StateDistrictSelector extends StatelessWidget {
  final StateController stateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return DropdownButton<String>(
            value: stateController.selectedStateId.value.isEmpty
                ? null
                : stateController.selectedStateId.value,
            hint: Text('Select State'),
            onChanged: (value) {
              if (value != null) {
                stateController.fetchDistricts(value);
              }
            },
            items: stateController.states.map((states) {
              return DropdownMenuItem<String>(
                value: states.id,
                child: Text(states.name),
              );
            }).toList(),
          );
        }),
        Obx(() {
          return DropdownButton<String>(
            value: stateController.selectedDistrictId.value.isEmpty
                ? null
                : stateController.selectedDistrictId.value,
            hint: Text('Select District'),
            onChanged: (value) {
              if (value != null) {
                stateController.selectedDistrictId.value = value;
              }
            },
            items: stateController.districts.map((district) {
              return DropdownMenuItem<String>(
                value: district.id,
                child: Text(district.name),
              );
            }).toList(),
          );
        }),
      ],
    );
  }
}
