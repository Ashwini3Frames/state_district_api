import 'package:state_district_api/data/models/state_model.dart';
import 'package:state_district_api/data/models/district_model.dart';
import 'package:state_district_api/data/services/api_service.dart';

class StateRepository {
  final ApiService apiService;

  StateRepository(this.apiService);

  Future<List<StateModel>> getStates() {
    return apiService.fetchStates();
  }

  Future<List<DistrictModel>> getDistricts(String stateId) {
    return apiService.fetchDistricts(stateId);
  }
}
