import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../admins/Login.dart';
import 'homepage.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset('lib/images/nike.png'),
              ),
              const SizedBox(
                height:45 ,),
              //title
              const Text('Just do it',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
              const SizedBox(
                height:45 ,),
              //sub title
              const Text('Brand sneakers and custom kicks made with premium quality',
                style: TextStyle(
                    fontSize: 16,
                  color: Colors.grey
                ),
              textAlign: TextAlign.center,),
              const SizedBox(
                height:45 ,),
              //start now button
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                    ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Center(
                      child: const Text('Shop now',
                      style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
