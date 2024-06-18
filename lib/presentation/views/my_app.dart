import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'state_district_selector.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('State and District Selector')),
        body: StateDistrictSelector(),
      ),
    );
  }
}

