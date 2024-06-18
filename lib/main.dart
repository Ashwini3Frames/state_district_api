import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_district_api/presentation/controllers/state_controller.dart';
import 'package:state_district_api/presentation/views/my_app.dart';
import 'data/services/api_service.dart';
import 'data/repositories/state_repository.dart';
import 'domain/usecases/get_states.dart';
import 'domain/usecases/get_districts.dart';
import 'package:http/http.dart' as http;
import 'package:state_district_api/presentation/views/state_district_selector.dart';
void main() {
  // Initialize the dependencies
  final apiService = ApiService(http.Client());
  final repository = StateRepository(apiService);
  final getStates = GetStates(repository);
  final getDistricts = GetDistricts(repository);
  final stateController = StateController(getStates: getStates, getDistricts: getDistricts);

  // Register the controller with GetX dependency injection
  Get.put(stateController);

  // Run the MyApp class
  runApp(MyApp());
}
