import 'package:demo_app/cart_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class cart_page extends StatelessWidget {
  const cart_page({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (BuildContext context, int index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'].toString()),
              radius: 30,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          title: Text('Are you sure?'),
                          titleTextStyle:
                              Theme.of(context).textTheme.titleMedium,
                          content:
                              Text('Do you really want to delete this item?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('No'),
                            ),
                            TextButton(
                                onPressed: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .removeProduct(cartItem);
                                  Navigator.of(context).pop();
                                },
                                child: Text('Yes',
                                    style: TextStyle(color: Colors.red))),
                          ]);
                    });
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size :\$${cartItem['size']} '),
          );
        },
      ),
    );
  }
}
