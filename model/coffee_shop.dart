import 'package:coffee_app/models/coffee.dart';
import 'package:flutter/material.dart';
class CoffeeShop extends ChangeNotifier{
  //coffee for sale
  final List<Coffee> _shop = [
    //black coffee
    Coffee(
        name: 'Long Black',
        price: '4.10',
        imagepath: "lib/images/185113_coffee_icon.png"
    ),
  //latte
    Coffee(
        name: 'Latte',
        price: '7.20',
        imagepath: "lib/images/392514_coffee_cup_drink_hot_tea_icon.png"
    ),
  //espresso
    Coffee(
        name: 'Long Black',
        price: '4.10',
        imagepath: "lib/images/889362_barista_coffee_coffee cup_coffee to go_cup_icon.png"
    ),
  //iced coffee
    Coffee(
        name: 'Long Black',
        price: '4.10',
        imagepath: "lib/images/9111006_coffee_icon.png"
    ),

  ];
  //user cart
List <Coffee> _usercart = [];

  //get coffee list
List<Coffee> get coffeeShop => _shop;

  //add item to cart
void addItemtocart(Coffee coffee){
  _usercart.add(coffee);
  notifyListeners();
}
  //remove item from cart
void removeItemfromcart(){
  _usercart.remove(Coffee );
}
}
