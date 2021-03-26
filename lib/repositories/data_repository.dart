import 'dart:convert';

import 'package:test_task/models/data.dart';
import 'package:test_task/services/data_service.dart';

import 'package:meta/meta.dart';

class DataRepository {
  final DataService dataService;

  DataRepository({@required this.dataService});

  Future<Data> fetchData() async {
    final data = await dataService.loadJsonData();
    final response = json.decode(data);
    return Data.fromJson(response);
  }
}
