import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:nahwu/screen/menu.dart';
import 'package:package_info/package_info.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  final myAppKey = GlobalKey();
  runApp(MyApp(
    key: myAppKey,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _splashKey = GlobalKey();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nahwu App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: SplashScreen(
        key: _splashKey,
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? buildVersion = " ";

  _pkgInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      buildVersion = packageInfo.version;
    });
  }

  @override
  void initState() {
    _pkgInfo();
    super.initState();
    Timer(
      const Duration(milliseconds: 3800),
      () => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MyMenu(),
        ),
        (e) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFFF800B),
              Color(0xFFCE1010),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 80.0,
                ),
                Image.asset(
                  'assets/image/logo.png',
                  height: 200.0,
                  width: 200.0,
                ),
                const Text(
                  "\n \n ilmu nahwu mencari kata \n kitab al-jurumiyah",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.only(top: 80.0),
              child: Text(
                "Version: $buildVersion",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
