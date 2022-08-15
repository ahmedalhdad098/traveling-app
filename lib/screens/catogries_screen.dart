// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/widgets/categories_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(child: Text("دليل سياحي")),
      //   ),
      body:
      Padding(
        padding: const EdgeInsets.all(10),
        child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1/1.3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10
          ),
          children:Categories_data.map((categoryData) {
            return CategoryItem(
                      id:categoryData.id ,
                      title: categoryData.title,
                      imageUrl: categoryData.imageUrl,
                      );
                    },
              ).toList(),
                  

        ),
      ) ,
    );
  }
}