import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plunes/providers.dart';
import 'package:plunes/user_list.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Users(),
          ),
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Users>(
      builder: (_, data, w) {
        return MaterialApp(
          title: 'Plunes',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              canvasColor: Colors.transparent, primaryColor: Colors.white),
          home: getHomeScreen(),
        );
      },
    );
  }

  Widget getHomeScreen() {
    Widget w;
    w = UserList();
    return w;
  }
}
