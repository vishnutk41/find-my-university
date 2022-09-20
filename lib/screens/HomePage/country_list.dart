
import 'package:flutter/material.dart';

import 'package:university/screens/HomePage/home_page.dart';

class CountryListScreen extends StatelessWidget {
   CountryListScreen({super.key});
final List<String> countryList =["india",
"United+Kingdom",
"United+States"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: ((context, index) =>GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage(countryname: countryList[index],)));
        },
        child: Text(countryList[index])) )),
    );
  }
}