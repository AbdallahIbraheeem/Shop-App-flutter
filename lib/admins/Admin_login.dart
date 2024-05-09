import 'package:firebase/admins/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Helper.dart';
import 'Login.dart';

class AdminLogin extends StatelessWidget {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "lib/images/nike.png",
                width: 210,
              ),
              Text('Login to Admin Account',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),
              SizedBox(height: 15,),
              TextField(
                controller: authService.adminEmail,
                decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: authService.adminPassword,
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 70)),
                  onPressed: (){
                    if(authService.adminEmail != '' && authService.adminPassword != ''){
                      authService.adminLogin(context);
                    }
                  }
                  , child: Text('Login',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
                  child: Text('Not Admin?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))
            ],
          ),
        ),
      ),
    );
  }
}