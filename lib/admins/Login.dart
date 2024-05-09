import 'package:firebase/admins/Admin_login.dart';
import 'package:firebase/admins/signup.dart';
import 'package:firebase/pages/admin_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Helper.dart';

class LoginScreen extends StatelessWidget {
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
              Text('Login your Account',
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
                    if(authService.email != '' && authService.password != ''){
                      authService.loginUser(context);
                    }
                  }
                  , child: Text('Login',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
              },
                  child: Text('Dont have an account',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminLogin()));
                },
                    child: Text('Go to Admin account',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))),
              )
            ],
          ),
        ),
      ),
    );
  }
}