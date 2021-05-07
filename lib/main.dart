import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Local Notification',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    var androidInit = new AndroidInitializationSettings('app_icon');
    var iosInit = new IOSInitializationSettings();
    var initSetting =
        new InitializationSettings(android: androidInit, iOS: iosInit);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initSetting,
        onSelectNotification: selectNotification);
  }

  Future selectNotification(String payload) async {}

  _showNotification()async {
    var androidDetails=new AndroidNotificationDetails("Channel ID", "Flutter Notification", "Welcome To flutter Community");
    var iosDetails=new IOSNotificationDetails();
    var genralNotificationDetails=new NotificationDetails(android: androidDetails,iOS: iosDetails);
    await flutterLocalNotificationsPlugin.show(0, 'Task', "Create your task", genralNotificationDetails);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Notification"),),
      body: Center(
        child: ElevatedButton(
          child: Text("Get Notification"),
          onPressed: _showNotification,
        ),
      ),
    );
  }
}
