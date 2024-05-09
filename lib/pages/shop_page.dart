import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Components/shoe_tile.dart';
import '../models/cart.dart';
import '../models/shoe.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context,listen: false).addItemToCart(shoe);
    showDialog(
      context: context,
      builder: (context) =>AlertDialog(title: Text('Succssfully added'),
        content: Text('Check your cart'),
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context,value,child)=>Column(
      children: [
        // search bar
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(8)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Search',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.search,
                color: Colors.white,
              ),
            ],
          ),
        ),
        //message
        //hot picks
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hot Picks🔥',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                'See all',
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              )
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Shoe shoe = value.getShoelist()[index];
                  return ShoeTile(
                    onTap: ()=>addShoeToCart(shoe),
                    shoe: shoe,
                  );
                })),
        const Padding(
          padding:  EdgeInsets.only(top: 20,left: 20,right: 20),
          child: Divider(
            color: Colors.grey,
          ),
        )
      ],
    ));
  }
}
