import 'package:firebase/pages/shop_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/Bottom_nav_bar.dart';
import '../Helper.dart';
import 'cart_page.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this selected index is to control the bottom nav bar
  int _selectedIndex = 0;
  // this method will update the selcted index
  //when the user taps on the bottom bar
  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  // pages to display
  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            AuthService authSevice = AuthService();
            authSevice.logOutUser(context);
          }, icon: Icon(Icons.logout))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding:  EdgeInsets.only(left: 12.0),
              child:  Icon(Icons.menu,
              color: Colors.black,),
            ),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },),
        ),
      ),
      drawer:  Drawer(
        backgroundColor: Colors.white ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //logo
                DrawerHeader(child: Image.asset('lib/images/nike.png',) ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(color: Colors.grey[800],),
                ),
                const Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About'),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
