import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/Cart_item.dart';
import '../Helper.dart';
import '../models/cart.dart';
import '../models/shoe.dart';
import 'admin_panel.dart';

class Accounts extends StatefulWidget {
  const Accounts ({Key? key}) : super(key: key);

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context,value,child)=> Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Admin Panel'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdminPanel()),
            );
          }, icon: Icon(Icons.supervised_user_circle)),
          IconButton(onPressed: (){
            AuthService authSevice = AuthService();
            authSevice.logOutUser(context);
          }, icon: Icon(Icons.logout)),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("user").snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,i){
                  return SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      width: 200,height: 100,
                      color: Colors.grey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Email : '+snapshot.data!.docs[i]['email']),
                          ]),
                    ),
                  );
                });
          }else{
            return CircularProgressIndicator();
          }
        },
      ),


    ),);}}
