import 'package:coffee_app/components/coffee_tile.dart';
import 'package:coffee_app/models/coffee.dart';
import 'package:coffee_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // Add coffee to cart
  void addtocart(Coffee coffee) {
    // Add coffee to cart
    Provider.of<CoffeeShop>(context, listen: false).addItemtocart(coffee);

    // Wait for 2 seconds, then show the alert dialog
    Future.delayed(Duration(seconds: 1), () {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Successfully added to cart"),
          content: Text("${coffee.name} has been added to your cart."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final coffeeShop = Provider.of<CoffeeShop>(context);

    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
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
                    // Get individual coffee
                    Coffee eachCoffee = value.coffeeShop[index];
                    return CoffeeTile(
                      coffee: eachCoffee,
                      icon: const Icon(Icons.add),
                      onPressed: () => addtocart(eachCoffee),
                      isCartPage: false, // Explicitly set to false for shop page
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
