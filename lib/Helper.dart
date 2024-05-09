import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/pages/admin_panel.dart';
import 'package:firebase/pages/homepage.dart';
import 'package:firebase/pages/intropage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'admins/Login.dart';

class AuthService{
  final auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController adminEmail = TextEditingController();
  TextEditingController adminPassword = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController name = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  void loginUser(context)async{
    try{
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
      await auth
          .signInWithEmailAndPassword
        (email: email.text, password: password.text)
          .then((value) => {print('User is Logged in'),
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false)
      });
    }catch(e)
    {Navigator.pop(context);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Error Massege'),
          content: Text(e.toString()),
        );
      });
    }
  }
  void adminLogin(context)async{

      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
      await FirebaseFirestore.instance.collection('admin').doc('adminLogin').snapshots().forEach((element) {
        if(element.data()?['adminEmail'] == adminEmail.text && element.data()?['adminPassword'] == adminPassword.text){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> AdminPanel()), (route) => false);
        }
      }).catchError((e){showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Error Massege'),
          content: Text(e.toString()),
        );
      });
      });

  }
  void RegisterUser(context)async{
    try {showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
      await auth
          .createUserWithEmailAndPassword(
          email: email.text, password: password.text)
          .then((value) {print('User Is Registered');
            firestore.collection('user').add({
              'email': email.text,
              'password': password.text,
              'uid': auth.currentUser!.uid
            });
      Navigator.push(context, MaterialPageRoute(builder: (c)=>HomePage()));
      });
    }catch(e){
      Navigator.pop(context);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Error Massege'),
          content: Text(e.toString()),
        );
      });
    }
  }
  void logOutUser(context)async{
    await auth.signOut();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (C)=>LoginScreen()), (route) => false);
  }
  void orderProduct(context)async{
    firestore.collection('order').add({
      'size': size.text,
      'orderid': auth.currentUser!.uid,
      'address': address.text,
      'name': name.text

    });
  }

}