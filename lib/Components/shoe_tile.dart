import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/shoe.dart';


class ShoeTile extends StatefulWidget {
  Shoe shoe;
  void Function()? onTap;
  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  State<ShoeTile> createState() => _ShoeTileState();
}

class _ShoeTileState extends State<ShoeTile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 20),
        width: 280,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // shoe pic
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(widget.shoe.imagePath)),
            // desc
            Text(
              widget.shoe.description,
              style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            //prise + detials
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      //shoe name
                      Text(widget.shoe.name,style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      )),
                      //prise
                      Text(widget.shoe.price,style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                      //plus button
                    ],
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10))),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
