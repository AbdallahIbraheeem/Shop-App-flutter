import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Components/Cart_item.dart';
import '../Helper.dart';
import '../models/cart.dart';
import '../models/shoe.dart';
import 'package:provider/provider.dart';

import 'Info_page.dart';
import 'admin_panel.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {

    return Consumer<Cart>(builder: (context,value,child)=>Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text('My Cart',
        style: TextStyle(fontSize: 25,
        fontWeight: FontWeight.bold),),
          const SizedBox(height: 30),
          Expanded(child: ListView.builder(
            itemCount: value.getUserCart().length,
              itemBuilder: (context,index)
          {
            Shoe individualShoe = value.getUserCart()[index];
            return CartItem(shoe: individualShoe,);
          }),

          ),

          Center(
            child: ElevatedButton(
                style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 70)),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoPage()),
                  );
                }
                , child: Text('buy',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))),
          ),
        ],
      ),
    ),);
  }
}
