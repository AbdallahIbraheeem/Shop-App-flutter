import 'package:firebase/admins/Admin_login.dart';
import 'package:firebase/admins/signup.dart';
import 'package:firebase/pages/admin_panel.dart';
import 'package:firebase/pages/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Helper.dart';

class InfoPage extends StatelessWidget {

  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('information',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),
              SizedBox(height: 15,),
              TextField(
                controller: authService.name,
                decoration: InputDecoration(
                    labelText: 'name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: authService.size,
                decoration: InputDecoration(
                    labelText: 'size',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: authService.address,
                decoration: InputDecoration(
                    labelText: 'address',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 70)),
                  onPressed: (){
                    if(authService.size != '' && authService.address != ''&& authService.name != ''){
                      authService.orderProduct(context);}

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        content: Text('Buying succeeded'),
                      );
                    });
                    }
                  , child: Text('Confirm purchase',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
            ],
          ),
        ),
      ),
    );
  }
}