import 'package:state_district_api/domain/entities/app_state.dart';
import 'package:state_district_api/data/repositories/state_repository.dart';

class GetStates {
  final StateRepository repository;

  GetStates(this.repository);

  Future<List<StateLoc>> call() async {
    final stateModels = await repository.getStates();
    return stateModels.map((model) => StateLoc(id: model.id, name: model.name)).toList();//entities format
  }
}
