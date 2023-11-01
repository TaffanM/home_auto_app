import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:home_automation/api.dart';
import 'package:home_automation/model/model_device.dart';
import 'package:provider/provider.dart';

class DeviceProvider extends ChangeNotifier {
  List<DeviceModel>? _deviceList;
  List<DeviceModel>? get deviceList => _deviceList;

  /// Property to check mounted before notify
  bool isDisposed = false;

  /// Event handling
  bool _onSearch = false;
  bool get onSearch => _onSearch;

  static DeviceProvider instance(BuildContext context) =>
      Provider.of(context, listen: false);

  Future<void> getDevice() async {
    await Future.delayed(Duration(milliseconds: 100));
    print('fetching device');
    setOnSearch(true);

    var rsp = await MainAPI().getData(MainAPI.getDevice);
    var jsonParse = json.decode(rsp);

    print(jsonParse);

    if (jsonParse is List) {
      List<dynamic> list = jsonParse;

      _deviceList = list.map((e) => DeviceModel.fromJson(e)).toList();
    } else {
      print(jsonParse['msg']);
      _deviceList = [];
    }

    setOnSearch(false);
  }

  /// Set event search
  void setOnSearch(bool value) {
    _onSearch = value;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!isDisposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }
}
