import 'package:get/get.dart';
import 'package:state_district_api/domain/usecases/get_states.dart';
import 'package:state_district_api/domain/usecases/get_districts.dart';
import 'package:state_district_api/domain/entities/app_state.dart';
import 'package:state_district_api/domain/entities/district.dart';

class StateController extends GetxController {
  final GetStates getStates;
  final GetDistricts getDistricts;

  var states = <StateLoc>[].obs;
  var districts = <District>[].obs;
  var selectedStateId = ''.obs;
  var selectedDistrictId = ''.obs;

  StateController({required this.getStates, required this.getDistricts});

  @override
  void onInit() {
    super.onInit();
    fetchStates();
  }

  void fetchStates() async {
    try {
      var stateList = await getStates();
      states(stateList);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch in controller states');
    }
  }

  void fetchDistricts(String stateId) async {
    try {
      selectedStateId.value = stateId;
      selectedDistrictId.value = '';
      var districtList = await getDistricts(stateId);
      districts.assignAll(districtList);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch in controller districts');
    }
  }
}
