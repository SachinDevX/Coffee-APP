import 'package:coffee_app/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final void Function()? onPressed;
  final Icon icon;
  final bool isCartPage; // Add this parameter

  const CoffeeTile({
    super.key,
    required this.coffee,
    required this.onPressed,
    required this.icon,
    this.isCartPage = false, // Default to false for shop page
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Text(coffee.price),
        trailing: IconButton(
          icon: isCartPage ? const Icon(Icons.delete) : const Icon(Icons.add),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
