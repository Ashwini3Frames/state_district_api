class StateModel {
  final String id;
  final String name;

  StateModel({required this.id, required this.name});

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      id: json['code'].toString(),
      name: json['name'],
    );
  }
}
