// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

import '../../database_local/database_favourite.dart';
import '../../model/university_list_response.dart';
import '../../services/database_helper.dart';
import '../../services/get_country_list.dart';
import '../../utilities/constants.dart';

class SubPage extends StatefulWidget {
  const SubPage({super.key, required this.countryName});
final String countryName;
  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  // int indexValue =
  List<bool> isAddedList = [];
  @override
  void initState() {
    fetchData(widget.countryName);


    super.initState();
  }

  void addToFavouriteOnTap(int index) async{
    isAddedList[index] = !isAddedList[index];

    setState(() {});

    if(isAddedList[index]){await DataBaseHelper.instance.add(
                                    FavouriteUniversity(
                                      
                                        name:
                                            universityListResponseModel![index]
                                                .name,
                                        website:
                                            universityListResponseModel![index]
                                                .webPages[0]),
                                                
                                  );}else{
                                     DataBaseHelper.instance.remove(
                                                  universityListResponseModel![index].name);
                                  }
     
  }

  void setFavouriteList() {
    for (int i = 0; i < universityListResponseModel!.length; i++) {
      isAddedList.add(false);
    }
  }

  List<UniversityListResponseModel>? universityListResponseModel;


  


  void fetchData(String countryName) async {


    universityListResponseModel = await getCountryList(countryName);
    setFavouriteList();
    setState(() {});
// print(universityListResponseModel![0].name);
  }

// void setIndexValue() async{
//   indexValue
//   setState(() {});
// }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: universityListResponseModel == null
            ? Center(child: CircularProgressIndicator())
            :
            
            ListView.builder(
                itemCount: universityListResponseModel!.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Text(
                                  universityListResponseModel![index].name,
                                  style: kUnivercityNameTextStyle,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                child: Text(
                                  universityListResponseModel![index]
                                      .webPages[0],
                                  style: kUnivercitywebsiteTextStyle,
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  softWrap: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //  IconButton(onPressed: setIndexValue, icon: Icon(
                              //       Icons.favorite_border,
                              //       color: Colors.white,
                              //       size: 30,
                              //     ),),
                              GestureDetector(
                                onTap: () async{


                                   addToFavouriteOnTap(index);
                                      // print('object,${universityListResponseModel![index]
                                      // .webPages[0]}');
                                   
                              
                             
                               
                                },
                                child: Icon(isAddedList[index]?
                                  Icons.favorite:Icons.favorite_border,
                                  color: Colors.white,
                                  size: 30,
                                ),
// isAddedList[index]
//                                       ? Icons.favorite_border
//                                       : 


                              ),

                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Text(
                                  'Add to favourites',
                                  style: kAddtofavouritesTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
    // });
  }
}
