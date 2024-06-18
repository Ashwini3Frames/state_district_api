import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:state_district_api/data/models/state_model.dart';
import 'package:state_district_api/data/models/district_model.dart';

class ApiService {
  final http.Client client;

  ApiService(this.client);

  Future<List<StateModel>> fetchStates() async {
    final response = await client.get(Uri.parse('http://43.240.67.219:6972/signifywarranty/api/register/getStates'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['list'];
      return data.map((json) => StateModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load in else states');
    }
  }

  Future<List<DistrictModel>> fetchDistricts(String stateId) async {
    final response = await client.get(Uri.parse('http://43.240.67.219:6972/signifywarranty/api/register/getDistrict/$stateId'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['list'];
      return data.map((json) => DistrictModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load districts');
    }
  }
}
