// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

import '../../database_local/database_favourite.dart';
import '../../services/database_helper.dart';
import '../../utilities/constants.dart';

class FavouriteListBody extends StatefulWidget {
  const FavouriteListBody({super.key});

  @override
  State<FavouriteListBody> createState() => _FavouriteListBodyState();
}

class _FavouriteListBodyState extends State<FavouriteListBody> {
  @override
  Widget build(BuildContext context) {
    // print("build");
    return SafeArea(
      child: FutureBuilder<List<FavouriteUniversity>>(
          future: DataBaseHelper.instance.getUniversities(),
          builder: (BuildContext context,
              AsyncSnapshot<List<FavouriteUniversity>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text("Empty List"),
              );
            }
            {
              // print(snapshot.data?.length);
              // snapshot.data!.map((favouriteUniversity) {
              //async
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) => Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 10, 0, 0),
                                          child: Text(
                                            snapshot.data![index].name,
                                            style: kUnivercityNameTextStyle,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              10, 10, 80, 0),
                                          child: Text(
                                            snapshot.data![index].website,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            setState(() {
                                              DataBaseHelper.instance.remove(
                                                  snapshot.data![index].name);
                                            });
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),

                                        // Icon(
                                        //   Icons.delete,
                                        //   color: Colors.white,
                                        //   size: 30,
                                        // ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 10, 0, 0),
                                          child: Text(
                                            'Delete',
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
                        ],
                      ));
              // });
            }
            // return SizedBox();
          }),
    );
  }
}
