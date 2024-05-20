import 'package:demo_app/cart_page.dart';
import 'package:demo_app/home_page.dart';
import 'package:flutter/material.dart';

class bottom_page extends StatefulWidget {
  const bottom_page({super.key});

  @override
  State<bottom_page> createState() => _bottom_pageState();
}

class _bottom_pageState extends State<bottom_page> {
  int select = 0;
  List<Widget> pages = [home_page(), cart_page()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: select,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        onTap: (value) {
          setState(() {
            select = value;
          });
        },
        currentIndex: select,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Cart')
        ],
      ),
    );
  }
}
