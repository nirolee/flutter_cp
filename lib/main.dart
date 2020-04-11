import 'package:chucp/navigator/tab_navigator.dart';
import 'package:flutter/material.dart';
// import 'package:amap_location/amap_location.dart';
// import 'package:chucp/common/config/config.dart';
void main()
{
  // AMapLocationClientsetApiKey(Config.LBSKEY);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '处cp',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
      ),
      home: TabNavigator(),
    );
  }
  
}



