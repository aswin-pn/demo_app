// import 'package:demo_app/global_variables.dart';
import 'package:demo_app/cart_provider.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> ash;
  const ProductDetailsPage({
    super.key,
    required this.ash,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedsize = 2;
  void onTap() {
    if (selectedsize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct({
        'id': widget.ash['id'],
        'title': widget.ash['title'],
        'price': widget.ash['price'],
        'imageUrl': widget.ash['imageUrl'],
        'company': widget.ash[' company'],
        'size': selectedsize,
      });
      const SnackBar(content: Text('Please add));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please enter the value')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Text(widget.ash['title'] as String,
              style: Theme.of(context).textTheme.titleLarge),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(widget.ash['imageUrl'] as String),
          ),
          const Spacer(
            flex: 2,
          ),
         
          Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 219, 236, 238),
                  borderRadius: BorderRadius.circular(50)),
              height: 250,
              child: Column(
                children: [
                  Text(
                    '\$${widget.ash['price']}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      itemCount: (widget.ash['sizes'] as List<int>).length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        final size = (widget.ash['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedsize = size;
                                });
                              },
                              child: Chip(
                                label: Text(size.toString()),
                                backgroundColor:
                                    selectedsize == size ? Colors.grey : null,
                              )),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton.icon(
                      onPressed: onTap,
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text('Add to cart'),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50)),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
