import 'package:flutter/material.dart';

class WishlistItem extends StatelessWidget {

  final String id;
  final double price;
  final int quantity;
  final String title;

  WishlistItem({
    @required this.id,
    @required this.price,
    @required this.quantity,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 3,
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(child: FittedBox(child: Text('\$$price'))),
          title: Text(title),
          subtitle: Text('Total: \$${(price * quantity)}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}