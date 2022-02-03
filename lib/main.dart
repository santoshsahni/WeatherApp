import 'package:weatherforcast/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:weatherforcast/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
   routes: {
     "/" : (context) => loading(),
     "/home" : (context) => home(),
     "/loading" : (context) => loading(),

   },
  ));
}

