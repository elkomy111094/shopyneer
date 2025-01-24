import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/config/theme/styles_manager.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:size_config/size_config.dart';

import '../../core/utils/get_asset_path.dart';
import '../home/widgets/animated_search_field.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  Map<String, bool> expandedState = {
    "رجال": false,
    "نساء": false,
    "أطفال": false,
    "المنزلية": false,
    "الموبايلات": false,
    "اللابتوب": false,
  };

  final Map<String, List<String>> subcategories = {
    "رجال": ["ملابس رجالية", "إكسسوارات", "أحذية"],
    "نساء": ["فساتين", "مجوهرات", "حقائب"],
    "أطفال": ["ملابس أطفال", "ألعاب", "أحذية"],
    "المنزلية": ["أدوات المطبخ", "أثاث", "ديكورات"],
    "الموبايلات": ["هواتف", "شواحن", "إكسسوارات"],
    "اللابتوب": ["أجهزة اللابتوب", "إكسسوارات", "الشاشات"],
  };

  int? expandedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Picture(
                getAssetImage("logo_without_bg.png"),
                width: 50.h,
                height: 50.h,
                color: primary,
              ),
            ),
            Gap(10.w),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: AnimatedSearchField(),
              ),
            ),
            Gap(10.w),
          ],
        ),
      ),
      body: MyGridView(),
    );
  }
}

class MyGridView extends StatefulWidget {
  @override
  _MyGridViewState createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  int? _expandedIndex; // Tracks which ListView is expanded, null if none

  // Hardcoded Data: Categories and Subcategories
  final List<Map<String, dynamic>> categories = [
    {
      "id": 0,
      'category': 'Fruits',
      'subcategories': ['Apple', 'Banana', 'Cherry', 'Date', 'Grapes'],
    },
    {
      "id": 1,
      'category': 'Vegetables',
      'subcategories': ['Carrot', 'Broccoli', 'Spinach', 'Potato', 'Tomato'],
    },
    {
      "id": 2,
      'category': 'Dairy',
      'subcategories': ['Milk', 'Cheese', 'Yogurt', 'Butter', 'Cream'],
    },
    {
      "id": 3,
      'category': 'Beverages',
      'subcategories': ['Coffee', 'Tea', 'Juice', 'Water', 'Soda'],
    },
    {
      "id": 4,
      'category': 'Snacks',
      'subcategories': ['Chips', 'Cookies', 'Nuts', 'Popcorn', 'Candy'],
    },
    {
      "id": 5,
      'category': 'Fruits',
      'subcategories': ['Apple', 'Banana', 'Cherry', 'Date', 'Grapes'],
    },
    {
      "id": 6,
      'category': 'Vegetables',
      'subcategories': ['Carrot', 'Broccoli', 'Spinach', 'Potato', 'Tomato'],
    },
    {
      "id": 7,
      'category': 'Dairy',
      'subcategories': ['Milk', 'Cheese', 'Yogurt', 'Butter', 'Cream'],
    },
    {
      "id": 8,
      'category': 'Beverages',
      'subcategories': ['Coffee', 'Tea', 'Juice', 'Water', 'Soda'],
    },
    {
      "id": 9,
      'category': 'Snacks',
      'subcategories': ['Chips', 'Cookies', 'Nuts', 'Popcorn', 'Candy'],
    },
  ];

  int opendedIndex = -1;
  int opendChunck = -1;

  List<List<T>> groupIntoChunksOfThree<T>(List<T> inputList) {
    List<List<T>> result = [];
    for (int i = 0; i < inputList.length; i += 3) {
      // Take a slice of the input list with at most 3 elements
      List<T> chunk = inputList.sublist(
          i, i + 3 > inputList.length ? inputList.length : i + 3);
      result.add(chunk);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    List chuncksList = groupIntoChunksOfThree(categories);
    List<Widget> chuncksListWidget = chuncksList
        .map((chunck) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200.h,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: chunck.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  opendedIndex = chunck[index]["id"];
                                  opendChunck =
                                      (chunck[index]["id"] / 3).floor();

                                  print(opendChunck);
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: chunck[index]["id"] == opendedIndex
                                      ? 10
                                      : 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.h),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3.7,
                                    decoration: BoxDecoration(
                                        color: greyFA,
                                        borderRadius:
                                            BorderRadius.circular(10.h),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/category_bg.jpg"),
                                            fit: BoxFit.cover),
                                        border: Border.all(
                                          color: chunck[index]["id"] ==
                                                  opendedIndex
                                              ? Colors.black
                                              : Colors.transparent,
                                        )),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.h),
                                      child: Center(
                                        child: Picture(
                                            'https://static.vecteezy.com/system/resources/previews/047/088/017/non_2x/pink-fashion-shoes-on-transparent-background-png.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "أحذيه",
                            style: getRegularBlack14Style(),
                          ),
                        ],
                      );
                    }),
              ),
            ))
        .toList();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: chuncksListWidget.length,
        itemBuilder: (context, index) {
          final category = categories[index];

          return Column(
            children: [
              chuncksListWidget[index],
              opendChunck == index
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          categories[opendedIndex]['subcategories'].length,
                      itemBuilder: (context, subIndex) {
                        return GestureDetector(
                          onTap: () {
                            Nav.categoryDetailsPage(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: greyFA,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.h),
                                  side: BorderSide(color: greyD0)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.h),
                                    child: Center(
                                      child: Picture(
                                        'https://www.pngarts.com/files/3/Nike-Running-Shoes-PNG-Picture.png',
                                        width: 40.h,
                                        height: 40.h,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      ' ${categories[opendedIndex]['subcategories'][subIndex]}',
                                      style: getBoldGreyD014Style(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
