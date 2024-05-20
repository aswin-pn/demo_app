//import 'package:demo_app/global_variables.dart';
import 'package:demo_app/bottom_navigation.dart';
import 'package:demo_app/cart_provider.dart';
//import 'package:demo_app/home_page.dart';
//import 'package:demo_app/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping App',
        home: const bottom_page(),
        // home: ProductDetailsPage(
        //   ash: products[0],
        // ),
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 128, 192, 245)),
            textTheme: const TextTheme(
              titleLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              bodySmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            appBarTheme: const AppBarTheme(
                color: Color.fromARGB(255, 196, 234, 239),
                titleTextStyle: TextStyle(fontSize: 26, color: Colors.black)),
            useMaterial3: true),
      ),
    );
  }
}
