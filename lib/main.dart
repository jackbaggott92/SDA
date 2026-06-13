import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenttoolboxv3/pages/home_page.dart';
import 'package:studenttoolboxv3/provider/anthro_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => AnthroProvider(),
    child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}
