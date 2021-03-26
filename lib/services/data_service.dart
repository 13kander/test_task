import 'dart:async';
import 'dart:math';

import 'package:flutter/services.dart';

class DataService {
  Future<String> loadJsonData() async {
    return Future.delayed(
        Duration(
          milliseconds: 300 + Random().nextInt(600 - 300),
        ), () async {
      var data = await rootBundle.loadString('assets/data.json');
      return data;
    });
  }
}
