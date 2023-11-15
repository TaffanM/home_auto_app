import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_automation/provider_list.dart';
import 'package:home_automation/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  var providers = await ProviderList.register();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(MyApp(
            providers: providers,
          )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.providers});
  final List<dynamic> providers;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...providers
      ],
      child: MaterialApp(
        title: 'Home Automation',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        home: HomeScreen(),
      ),
    );
  }
}
