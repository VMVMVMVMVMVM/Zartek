import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:zartek_foodie/widgets/app_drawer.dart';
import 'package:zartek_foodie/widgets/item_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final MenuListController menuListController = Get.put(MenuListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Zartek Foodie'),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                AppDrawer(),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Logout"),
                  onTap: signOut
                )
                // TextButton.icon(
                //     onPressed: (){
                //       FirebaseAuth.instance.signOut();
                //     },
                //     icon: Icon(
                //       Icons.logout,
                //       color: Colors.grey,
                //     ),
                //     label: Text(
                //       'Log out',
                //       style: TextStyle(
                //         color: Colors.grey,
                //       ),
                //     ))
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Expanded(
              child: ItemTile(),
            ),
          ],
        ),
      ),
    );
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).popUntil((route) => route.isFirst);

  }
}
