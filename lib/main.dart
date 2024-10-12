import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/currency_converter_material_page.dart';
import 'currency_converter_material_page.dart'; //this is called relative importing

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CurrencyConverterMaterialPage(),
    );
  }
}
