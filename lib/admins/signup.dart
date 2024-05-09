import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Helper.dart';
import 'Login.dart';

class Register extends StatelessWidget {
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
            children: [                  Image.asset(
              "lib/images/nike.png",
              width: 210,
            ),
              Text('Register',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),
              SizedBox(height: 15,),
              TextField(
                controller: authService.email,
                decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: authService.password,
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
                    if(authService.email != '' && authService.password != '' ){
                      authService.RegisterUser(context);
                    }
                  }
                  , child: Text('Register',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
                  child: Text('Already have an account',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))
            ],
          ),
        ),
      ),
    );
  }
}