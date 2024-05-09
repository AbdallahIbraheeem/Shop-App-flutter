import 'package:firebase/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends ChangeNotifier{
  // list of sheo for sale
  List<Shoe> shoeShop = [
    Shoe(name: 'Zoom Freak', price: '230', imagePath: 'lib/images/airmax.webp', description: 'Cool Sheo'),
    //Shoe(name: 'airJordan', price: '220', imagePath: 'lib/images/airjordan.png', description: 'Cool Sheo'),
    Shoe(name: 'kdtrey', price: '230', imagePath: 'lib/images/kdtrey.jpg', description: 'Cool Sheo'),
    //Shoe(name: 'kyrie', price: '230', imagePath: 'lib/images/kyrie.png', description: 'Cool Sheo'),
  ];
  // list of items in user cart
  List<Shoe> userCart = [];
  // list of sheo for sale
  List<Shoe> getShoelist(){
    return shoeShop;
  }
  // get cart
  List<Shoe> getUserCart(){
    return userCart;
  }
  // add items to cart
  void addItemToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }
  // remove item from cart
  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }
}