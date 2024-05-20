import 'package:demo_app/global_variables.dart';
import 'package:demo_app/product_card.dart';
import 'package:demo_app/product_details_page.dart';
import 'package:flutter/material.dart';
//import 'package:demo_app/bottom_navigation.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final List<String> filters = const ['All', 'Adidias', 'Nike', 'Puma', 'zyra'];
  late String selectedfilter;

  @override
  void initState() {
    super.initState();
    selectedfilter = filters[0];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Shoes\nCollection',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(20)),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                  itemCount: filters.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    final filter = filters[index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedfilter = filter;
                          });
                        },
                        child: Chip(
                          backgroundColor:
                              selectedfilter == filter ? Colors.grey : null,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(color: Colors.black),
                          ),
                          label: Text(
                            filter,
                          ),
                          labelStyle: const TextStyle(fontSize: 15),
                        ),
                      ),
                    );
                  })),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) {
                          return ProductDetailsPage(ash: product);
                        })),
                      );
                    },
                    child: project_card(
                        title: product['title'].toString(),
                        price: product['price'] as double,
                        backgroundColor: index.isEven
                            ? const Color.fromARGB(255, 230, 239, 244)
                            : Colors.white,
                        image: product['imageUrl'] as String),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
