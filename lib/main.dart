
import 'package:ask_before_project1/ui/views/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main (){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.notoSerifTextTheme(
          Theme.of(context).textTheme.apply(fontSizeFactor: 1.2,),

        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: Color(0xFF4F7C87),
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF4F7C87)
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
