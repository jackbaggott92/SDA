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
    return MaterialApp(
      theme: ThemeData(
        sliderTheme: SliderThemeData(
          activeTrackColor: const Color.fromARGB(255, 144, 60, 255),
          inactiveTrackColor: const Color.fromARGB(255, 128, 128, 128),
          thumbColor: const Color.fromARGB(255, 219, 219, 219),
          overlayColor: const Color.fromARGB(255, 0, 122, 255).withOpacity(0.2),
          valueIndicatorColor: const Color.fromARGB(255, 0, 122, 255) ,
        ),
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(  
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 0, 0, 0),
          focusColor: Color.fromARGB(255, 0, 122, 255),
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white70),
        ),

      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage()
    );
  }
}
