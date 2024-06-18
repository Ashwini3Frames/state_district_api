import 'package:state_district_api/domain/entities/district.dart';
import 'package:state_district_api/data/repositories/state_repository.dart';

class GetDistricts {
  final StateRepository repository;

  GetDistricts(this.repository);

  Future<List<District>> call(String stateId) async {
    final districtModels = await repository.getDistricts(stateId);
    return districtModels.map((model) => District(id: model.id, name: model.name)).toList();
  }
}
