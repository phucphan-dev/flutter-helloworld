import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_world/ui/login.dart';
import 'package:hello_world/ui/registration.dart';

import 'constants/assets.dart';

class MainLayout extends StatelessWidget {
  final Widget children;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.backgroundApp), fit: BoxFit.fill),
            ),
            child: SafeArea(child: children),
          ),
        ));
  }

  const MainLayout({Key? key, required this.children}) : super(key: key);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appName = 'Utu';

    return GetMaterialApp(
      title: appName,
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      home: const MainLayout(children: LoginScreen()),
      routes: {
        '/registration': (context) => const MainLayout(children: RegistrationScreen()),
      },
    );
  }
}

void main() {
  runApp(const MyApp());
}
