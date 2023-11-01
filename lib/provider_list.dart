import 'package:home_automation/providers/device_provider.dart';
import 'package:provider/provider.dart';

class ProviderList {
  static Future register() async => [
    ChangeNotifierProvider(create: (context) => DeviceProvider())
  ];
}
