
import 'package:flutter/material.dart';

import 'package:university/screens/HomePage/home_page.dart';

class CountryListScreen extends StatelessWidget {
   CountryListScreen({super.key});
final List<String> countryList =["india",
"United+Kingdom",
"United+States"];
final List<String> countryNameList =["India",
"United Kingdom",
"United States"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:AppBar(
      //   elevation: 0,
      
      //  backgroundColor: Color.fromARGB(255, 77, 57, 239),
      //   title: Padding(padding: EdgeInsets.fromLTRB(75, 0, 0, 0),
      //   child: Text(
      // 'Select a Country',
      // style:TextStyle
      //       ( color: Colors.white,
      //       fontSize: 22,),
           
      //     ),
      // ), 

      // ),
      
      
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 280,
            decoration: const BoxDecoration(

              color: Color.fromARGB(255, 77, 57, 239)
            //     gradient: LinearGradient(
            //   colors: [Color(0xFFFACCCC), Color(0xFFF6EFE9)],
              
            // )
            ),
            child: Center(child:Text("Select Your Country",style: TextStyle(fontSize: 30,color: Colors.white),),),
            
            ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: ((context, index) =>GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage(countryname: countryList[index],)));
              },
              child: Center(child: 
              
                
                 
                  Column(
                    children:[ 
                      
                      Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                         
                      ),
                      child: Column(
                      children: [
                      
                        Text(countryNameList[index],
                      style: TextStyle(fontSize: 30),),],
                         
                        ),
                    ),]
                  ),
                
              )) )),
          ),
        ],
      ),
    );
  }
}