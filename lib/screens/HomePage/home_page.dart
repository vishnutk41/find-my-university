// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../favourites_list/favourite_list.dart';
import 'mainpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.countryname});
final String countryname;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 77, 57, 239),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
//             child: IconButton(
//               onPressed: (){
//     FavouriteList();
// },
//              icon: Icon(Icons.favorite_sharp,
//               color: Colors.white,
//               size: 30,),
//             ),
            child: GestureDetector(
              onTap: () async {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FavouriteList()));
              },
              child: Icon(
                Icons.favorite_sharp,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Icon(
              Icons.location_on,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: SubPage(countryName:widget.countryname),
    );
  }
}
