import 'package:flutter/material.dart';
import 'homepage.dart';

void main(){
  runApp(SignApp());
}

class SignApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: "İmza Yazılımı",
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}