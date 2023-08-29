import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laws_of_power/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.brown,
          textTheme:
              TextTheme(bodyText2: GoogleFonts.lato(color: Colors.grey[200]))),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
