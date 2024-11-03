import 'package:coffee_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    final coffeeShop = Provider.of<CoffeeShop>(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              "How would you like your coffee?",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 25),
            // List of coffee to buy
            Expanded(
              child: ListView.builder(
                itemCount: coffeeShop.coffeeShop.length,
                itemBuilder: (context, index) {
                  final coffee = coffeeShop.coffeeShop[index];
                  return ListTile(
                    title: Text(coffee.name),
                    subtitle: Text('\$${coffee.price}'),
                    leading: Image.asset(coffee.imagepath),
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
