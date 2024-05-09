import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/Cart_item.dart';
import '../Helper.dart';
import '../models/cart.dart';
import '../models/shoe.dart';
import 'acc_page.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel ({Key? key}) : super(key: key);

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
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
                MaterialPageRoute(builder: (context) => Accounts()),
              );
            }, icon: Icon(Icons.supervised_user_circle)),
            IconButton(onPressed: (){
              AuthService authSevice = AuthService();
              authSevice.logOutUser(context);
            }, icon: Icon(Icons.logout)),
          ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("order").snapshots(),
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
                          Text('Name : '+snapshot.data!.docs[i]['name']),
                          Text('size : '+snapshot.data!.docs[i]['size']),
                          Text('address : '+snapshot.data!.docs[i]['address']),
                          Text('orderid : '+snapshot.data!.docs[i]['orderid'])

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
