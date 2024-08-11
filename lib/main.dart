import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:customize/pages/input/edit.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

  var cameraStatus = await Permission.camera.request();
  if (cameraStatus.isGranted) {
    // Permission is granted
  } else {
    // Permission denied
  }
  var storageStatus = await Permission.storage.request();
  if (storageStatus.isGranted) {
    // Permission is granted
  } else {
    // Permission not granted
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: AnimatedSplashScreen(
      duration: 5000,
      splash: Container(
        // width: 300,
        height: 540,
        child: Image(
          image: AssetImage(
            "assets/tit.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
      nextScreen: EditPage(),
      splashTransition: SplashTransition.scaleTransition,
      // backgroundColor: Colors.black,
    ));
  }
}
